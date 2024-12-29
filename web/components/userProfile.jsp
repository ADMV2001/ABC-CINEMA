<%-- 
    Document   : userProfile
    Created on : Dec 17, 2024, 6:24:42 AM
    Author     : Minula Vihanga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/userProfile.css"/>
        <title>JSP Page</title>
        <style>
        .profile-container {
            display: flex;
            flex-direction: column;
            gap: 20px;
            padding: 20px;
        }
        .user-info {
            text-align: center;
        }
        .user-info img {
            width: 100%;
            max-width: 150px;
            border-radius: 50%;
            margin-bottom: 15px;
        }

        .user-info h2 {
            opacity: 0;
            transform: translateX(-50px);
            animation: slideIn 1s forwards;
        }

        @keyframes slideIn {
            0% {
                opacity: 0;
                transform: translateX(-50px);
            }
            100% {
                opacity: 1;
                transform: translateX(0);
            }
        }

        .details-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }
        .details-section {
            flex: 1;
            min-width: 300px;
            border: 1px solid #ccc;
            border-radius: 8px;
            padding: 15px;
        }
        .details-section h3 {
            margin-bottom: 10px;
        }
        .details-list {
            list-style: none;
            padding: 0;
        }
        .details-list li {
            margin-bottom: 10px;
            background-color: #f9f9f9;
            border-radius: 8px;
            padding: 10px;
            color: #333;
            transition: transform 0.3s ease, box-shadow 0.3s ease, background-color 0.3s ease, box-shadow 0.3s ease;
            position: relative;
        }

        .details-list li:hover {
            
            background-color: rgba(0, 0, 0, 0.7);
            color: #550707;
            
        }

        .details-list li:nth-child(odd) {
            background-color: #e9f5fb;
        }

        .details-list li:nth-child(even) {
            background-color: #fff;
        }

        @keyframes rgbGlow {
            0% {
                box-shadow: 0 0 15px rgba(255, 0, 0, 0.7), 0 0 30px rgba(0, 255, 0, 0.7), 0 0 45px rgba(117, 6, 6, 0.7);
            }
            50% {
                box-shadow: 0 0 25px rgba(255, 0, 0, 0.7), 0 0 50px rgba(0, 255, 0, 0.7), 0 0 75px rgba(117, 6, 6, 0.7);
            }
            100% {
                box-shadow: 0 0 15px rgba(255, 0, 0, 0.7), 0 0 30px rgba(0, 255, 0, 0.7), 0 0 45px rgba(117, 6, 6, 0.7);
            }
        }

        .us-btn {
            margin-top: 15px;
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .us-btn:hover {
            background-color: white;
        }
        .us-btn-edit {
            margin-left: 10px;
        }
        .editable {
            cursor: pointer;
            color: #e72e2e;
        }
        .editable:hover {
            text-decoration: underline;
        }
        .hidden {
            display: none;
        }
    </style>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/components/nav.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/components/footer.css"/>
    </head>
    <body>
        <%@ include file="nav.jsp"%>
        <main class="profile-container">
        <section class="user-info">
            <h2>Welcome User!</h2>
            <img src="${pageContext.request.contextPath}/images/profile.png" alt="User Avatar" class="avatar">
            <p class="email">example.gmail.com <span class="editable" onclick="editField('email')">Edit</span></p>
        </section>

        <div class="details-container">
            <section class="details-section">
                <h3>User Details</h3>
                <ul class="details-list">
                    <li><strong>User Name :</strong> <span id="address">John Abraham</span> <span class="editable" onclick="editField('address')">Edit</span></li>
                    <li><strong>Mobile :</strong> <span id="debit-card">077-0000000</span> <span class="editable" onclick="editField('debit-card')">Edit</span></li>
                </ul>
            </section>

            
        </div>

        <section class="settings">
            <button class="us-btn">Logout</button>
        </section>
    </main>

    <footer class="footer">
        <%@ include file="footer.jsp" %>
    </footer>

    <script>
        function editField(fieldId) {
            const field = document.getElementById(fieldId);
            const currentValue = field.innerText;

            const input = document.createElement('input');
            input.type = 'text';
            input.value = currentValue;
            input.id = fieldId + '-input';

            const saveButton = document.createElement('button');
            saveButton.innerText = 'Save';
            saveButton.classList.add('btn', 'btn-edit');

            saveButton.onclick = function() {
                field.innerText = input.value;
                input.remove();
                saveButton.remove();
            };

            field.innerText = '';
            field.appendChild(input);
            field.parentNode.appendChild(saveButton);
        }
    </script>
    </body>
</html>
