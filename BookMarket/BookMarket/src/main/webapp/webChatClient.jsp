<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Web Chat</title>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
    <style type="text/css">
        * {
            font-family: 나눔고딕, Arial, sans-serif;
            box-sizing: border-box;
        }
        body, html {
            margin: 0;
            padding: 0;
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            background: #f2f2f2;  /* 배경색 */
        }
        #main-container {
            width: 90%;  /* 기본 너비를 90%로 설정 */
            max-width: 600px;  /* 최대 너비 600px */
            height: 90%;  /* 기본 높이 설정 */
            max-height: 90%;  /* 최대 높이 설정 */
            border: 1px solid #ddd;
            border-radius: 10px;  /* 모서리 둥글게 */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            background: #ffffff;  /* 채팅창 배경색 */
            display: flex;
            flex-direction: column;
            overflow: hidden;  /* 내부 내용 오버플로우 숨김 */
        }
        #chat-container {
            flex: 1;
            padding: 10px;
            overflow-y: auto;
            background: #fafafa;  /* 채팅 배경색 */
        }
        .chat {
            padding: 10px;
            margin: 5px;
            max-width: 80%;
            word-break: break-word;
            display: inline-block;
            border-radius: 10px;
            background: #e9e9eb;  /* 다른 사람 채팅 색상 */
            color: #333;
            text-align: left;
            border-radius: 10px 10px 10px 0;
            position: relative;
            float: left;  /* 왼쪽 정렬 */
            clear: both;
        }
        .my-chat {
            padding: 10px;
            margin: 5px;
            max-width: 80%;
            word-break: break-word;
            display: inline-block;
            border-radius: 10px;
            background: #a1e3a1;  /* 본인 채팅 색상 */
            color: #000;
            text-align: left;
            border-radius: 10px 10px 0 10px;
            position: relative;
            float: right;  /* 오른쪽 정렬 */
            clear: both;
        }
        .notice {
            text-align: center;
            color: #666;
            margin: 10px 0;
        }
        #bottom-container {
            display: flex;
            padding: 10px;
            border-top: 1px solid #ddd;
            background: #f9f9f9;
            align-items: center;  /* 세로 중앙 정렬 */
        }
        #inputMessage {
            flex: 1;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
        }
        #btnSubmit, #btnBack {
            margin-left: 10px;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }
        #btnSubmit {
            background: #007bff;
            color: white;
        }
        #btnBack {
            background: #dc3545;
            color: white;
        }

        /* 반응형 디자인 */
        @media (max-width: 600px) {
            #main-container {
                width: 100%;  /* 모바일에서는 100% 너비 */
                height: 100%;  /* 모바일에서는 100% 높이 */
                border-radius: 0;
            }
            #bottom-container {
                flex-direction: column;
            }
            #inputMessage {
                width: 100%;
                margin-bottom: 10px;
            }
            #btnSubmit, #btnBack {
                width: 100%;
                margin-left: 0;
                margin-bottom: 10px;
            }
        }
    </style>
</head>
<body>
    <div id="main-container">
        <div id="chat-container">
            <!-- 채팅 메시지 표시 영역 -->
        </div>
        <div id="bottom-container">
            <input id="inputMessage" type="text" placeholder="메시지 입력">
            <button id="btnSubmit">전송</button>
            <button id="btnBack" onclick="goBack()">돌아가기</button>
        </div>
    </div>

<% 
    String wsSite;

    boolean isWindows = System.getProperty("os.name").toLowerCase().startsWith("windows");

    if(isWindows) wsSite="ws://localhost:8080/BookMarket/webChatServer";  // 로컬 테스트용 주소
    else wsSite="wss://210.119.103.168:8080/kjj123000/webChatServer";    // 실제 서버용 주소
%>

<!-- 소켓 통신 자바 스크립트: 들어온 메시지나 전송할 메시지를 처리한다. -->
<script type="text/javascript">
    var webSocket = new WebSocket("<%= wsSite %>");
    var chatContainer = document.getElementById("chat-container");
    var inputMessage = document.getElementById('inputMessage'); 

    webSocket.onmessage = function onMessage(e) {
        var message = document.createElement("div");
        message.className = "chat";
        message.textContent = e.data;
        chatContainer.appendChild(message);
        chatContainer.scrollTop = chatContainer.scrollHeight;
    }

    webSocket.onopen = function onOpen(e) {
        var notice = document.createElement("div");
        notice.className = "notice";
        notice.textContent = "=== Connected Chat Server ===";
        chatContainer.appendChild(notice);
    }

    webSocket.onerror = function onError(e) {
        alert("Error: " + e.data);
    }

    function send() {
        if (inputMessage.value.trim() === "") return;
        var message = document.createElement("div");
        message.className = "my-chat";
        message.textContent = inputMessage.value;
        chatContainer.appendChild(message);
        webSocket.send(inputMessage.value);
        inputMessage.value = "";
        chatContainer.scrollTop = chatContainer.scrollHeight;
    }

    function goBack() {
        window.location.href = 'books.jsp';
    }
</script>

<!-- 엔터키를 치거나 전송 버튼을 누르면 송신하는 자바 스크립트 -->
<script type="text/javascript">
    $(function(){
        $('#btnSubmit').click(function(){
            send();
        });

        $('#inputMessage').keydown(function(key){
            if(key.keyCode == 13){
                send();
            }
        });
    })
</script>
</body>
</html>
