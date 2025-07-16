package mvc.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mvc.model.AccountDAO;
import mvc.model.AccountDTO;
import mvc.model.TransactionDTO;
import mvc.model.TransactionDAO;


@WebServlet({"/NewAccount.do", "/Withdraw.do", "/Transfer.do", "/Send.do","/Transaction.do"})
public class BankingControllerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String requestURI = request.getRequestURI();
        String contextPath = request.getContextPath();
        String command = requestURI.substring(contextPath.length());
        response.setContentType("text/html; charset=utf-8");
        request.setCharacterEncoding("utf-8");

        if (command.equals("/NewAccount.do")) {      // 계좌생성 
            NewAccount(request, response);
            RequestDispatcher rd = request.getRequestDispatcher("./bank/NewAccount.jsp");
            rd.forward(request, response);
          }
          else if (command.equals("/Withdraw.do")) {    // 출금
            Withdraw(request, response);
            RequestDispatcher rd = request.getRequestDispatcher("./bank/Withdraw.jsp");
            rd.forward(request, response);
            }
          else if (command.equals("/Transfer.do")) {       // 입금
            Transfer(request, response);
            RequestDispatcher rd = request.getRequestDispatcher("./bank/Transfer.jsp");
            rd.forward(request, response);
          }
          else if (command.equals("/Send.do")) {   // 이체
              Send(request, response);
              RequestDispatcher rd = request.getRequestDispatcher("./bank/Send.jsp");
              rd.forward(request, response);
            }
          else if (command.equals("/Transaction.do")) {   // 이체내역
              Transaction(request, response);
              RequestDispatcher rd = request.getRequestDispatcher("./bank/Transaction.jsp");
              rd.forward(request, response);
            }
        }

    private void Transaction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    	// 세션을 통해 로그인된 사용자의 ID를 가져옴
	    String loggedInUserId = (String) request.getSession().getAttribute("sessionId");

	    // 로그인되지 않은 경우 로그인 페이지로 이동
	    if (loggedInUserId == null) {
	        response.sendRedirect("login.jsp"); // 로그인 페이지로 이동하도록 설정
	        return;
	    }
    	
    	// TransactionDAO를 사용하여 모든 거래내역을 가져옴
        TransactionDAO transactionDAO = new TransactionDAO();
        List<TransactionDTO> transactionList = transactionDAO.getAllTransactions();

        // JSP로 전달
        request.setAttribute("transactionList", transactionList);
        RequestDispatcher rd = request.getRequestDispatcher("./bank/Transaction.jsp");
        rd.forward(request, response);
    }

    private void Send(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
    	// 세션을 통해 로그인된 사용자의 ID를 가져옴
	    String loggedInUserId = (String) request.getSession().getAttribute("sessionId");

	    // 로그인되지 않은 경우 로그인 페이지로 이동
	    if (loggedInUserId == null) {
	        response.sendRedirect("login.jsp"); // 로그인 페이지로 이동하도록 설정
	        return;
	    }
	    
	    // 등록 버튼을 누른 시간을 현재 시간으로 설정
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date currentDate = new Date();
        String transactionTime = dateFormat.format(currentDate);
        
        String accountNumber = request.getParameter("accountNumber");
        String otherAccount = request.getParameter("otherAccount");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String bank = request.getParameter("bank");
        String type = request.getParameter("type");
        int money = Integer.parseInt(request.getParameter("money"));
		
        TransactionDTO transaction = new TransactionDTO();
        transaction.setAccountNumber(accountNumber);
        transaction.setOtherAccount(otherAccount);
        transaction.setPassword(password);
        transaction.setName(name);
        transaction.setType(type);
        transaction.setBank(bank);
        transaction.setMoney(money);
        transaction.setTransactionTime(transactionTime);
        
        
        TransactionDAO transactionDAO = new TransactionDAO();
        boolean success = transactionDAO.insertAccount(transaction);

        if (success) {
            RequestDispatcher rd = request.getRequestDispatcher("bank.jsp");
            rd.forward(request, response);
        } else {
            
            response.sendRedirect("Send.jsp?error=1");
        }
        
        
	}

	

	private void Transfer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 세션을 통해 로그인된 사용자의 ID를 가져옴
	    String loggedInUserId = (String) request.getSession().getAttribute("sessionId");

	    // 로그인되지 않은 경우 로그인 페이지로 이동
	    if (loggedInUserId == null) {
	        response.sendRedirect("login.jsp"); // 로그인 페이지로 이동하도록 설정
	        return;
	    }
	    
	    // 등록 버튼을 누른 시간을 현재 시간으로 설정
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date currentDate = new Date();
        String transactionTime = dateFormat.format(currentDate);
        
        String accountNumber = request.getParameter("accountNumber");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String bank = request.getParameter("bank");
        String type = request.getParameter("type");
        int money = Integer.parseInt(request.getParameter("money"));
		
        TransactionDTO transaction = new TransactionDTO();
        transaction.setAccountNumber(accountNumber);
        transaction.setPassword(password);
        transaction.setName(name);
        transaction.setType(type);
        transaction.setBank(bank);
        transaction.setMoney(money);
        transaction.setTransactionTime(transactionTime);
        
        
        TransactionDAO transactionDAO = new TransactionDAO();
        boolean success = transactionDAO.insertAccount(transaction);

        if (success) {
            RequestDispatcher rd = request.getRequestDispatcher("bank.jsp");
            rd.forward(request, response);
        } else {
            
            response.sendRedirect("Transfer.jsp?error=1");
        }
        
        
	}

	private void Withdraw(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 세션을 통해 로그인된 사용자의 ID를 가져옴
	    String loggedInUserId = (String) request.getSession().getAttribute("sessionId");

	    // 로그인되지 않은 경우 로그인 페이지로 이동
	    if (loggedInUserId == null) {
	        response.sendRedirect("login.jsp"); // 로그인 페이지로 이동하도록 설정
	        return;
	    }
	    
	    // 등록 버튼을 누른 시간을 현재 시간으로 설정
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date currentDate = new Date();
        String transactionTime = dateFormat.format(currentDate);
        
        String accountNumber = request.getParameter("accountNumber");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String bank = request.getParameter("bank");
        String type = request.getParameter("type");
        int money = Integer.parseInt(request.getParameter("money"));
		
        TransactionDTO transaction = new TransactionDTO();
        transaction.setAccountNumber(accountNumber);
        transaction.setPassword(password);
        transaction.setName(name);
        transaction.setType(type);
        transaction.setBank(bank);
        transaction.setMoney(money);
        transaction.setTransactionTime(transactionTime);
        
        
        TransactionDAO transactionDAO = new TransactionDAO();
        boolean success = transactionDAO.insertAccount(transaction);

        if (success) {
            RequestDispatcher rd = request.getRequestDispatcher("bank.jsp");
            rd.forward(request, response);
        } else {
            
            response.sendRedirect("Withdraw.jsp?error=1");
        }
        
        
	}
	
	

	private void NewAccount(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
		// 세션을 통해 로그인된 사용자의 ID를 가져옴
	    String loggedInUserId = (String) request.getSession().getAttribute("sessionId");

	    // 로그인되지 않은 경우 로그인 페이지로 이동
	    if (loggedInUserId == null) {
	        response.sendRedirect("login.jsp"); // 로그인 페이지로 이동하도록 설정
	        return;
	    }
	    
	    // 등록 버튼을 누른 시간을 현재 시간으로 설정
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date currentDate = new Date();
        String registDay = dateFormat.format(currentDate);
		
		String accountNumber = request.getParameter("accountNumber");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");
        String bank = request.getParameter("bank");
        String place = request.getParameter("place");
        int money = Integer.parseInt(request.getParameter("money"));
        
        AccountDTO account = new AccountDTO();
        account.setId(loggedInUserId); // 로그인된 사용자의 ID 설정
        account.setAccountNumber(accountNumber);
        account.setPassword(password);
        account.setName(name);
        account.setGender(gender);
        account.setAddress(address);
        account.setBank(bank);
        account.setPlace(place);
        account.setMoney(money);
        account.setRegistDay(registDay); // registDay 설정
        
        AccountDAO accountDAO = new AccountDAO();
        boolean success = accountDAO.insertAccount(account);

        if (success) {
            RequestDispatcher rd = request.getRequestDispatcher("bank.jsp");
            rd.forward(request, response);
        } else {
            // Handle error if insertion fails
            response.sendRedirect("NewAccount.jsp?error=1");
        }
    }
}
