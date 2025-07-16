package mvc.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import mvc.database.DBConnection;

public class AccountDAO {
	public boolean insertAccount(AccountDTO account) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        
        try {
            conn = DBConnection.getConnection();
            String sql = "INSERT INTO account (id, accountNumber, password, name, gender, address, bank, place, money, registDay) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, account.getId());
            pstmt.setString(2, account.getAccountNumber());
            pstmt.setString(3, account.getPassword());
            pstmt.setString(4, account.getName());
            pstmt.setString(5, account.getGender());
            pstmt.setString(6, account.getAddress());
            pstmt.setString(7, account.getBank());
            pstmt.setString(8, account.getPlace());
            pstmt.setInt(9, account.getMoney());
            pstmt.setString(10, account.getRegistDay());
            
            int rows = pstmt.executeUpdate();
            return rows > 0;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return false;
        } finally {
            if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    }
}