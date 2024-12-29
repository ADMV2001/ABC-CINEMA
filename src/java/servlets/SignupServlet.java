package servlets;

import DAO.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.RequestDispatcher;

import javax.mail.*;
import javax.mail.internet.*;
import java.util.Properties;


public class SignupServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SignupServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SignupServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String fname = request.getParameter("firstName");
        String lname = request.getParameter("lastName");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        UserDAO user = new UserDAO();
        boolean emailExists = user.isEmailExist(email);
        
        if (emailExists)
        {
            request.setAttribute("errorMessage", "-This email is already registered. Please try another one!-");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/signup.jsp");
            dispatcher.forward(request, response);
        }
        else
        {
            boolean isTrue;
            isTrue = user.addUser(fname, lname, email, mobile, username, password);
            
            if(isTrue)
            {
                RequestDispatcher dis1 = request.getRequestDispatcher("login.jsp");
                dis1.forward(request,response);
                
                // Send confirmation email after successful registration
                sendConfirmationEmail(email, fname);
            }
            else
            {
                request.setAttribute("errorMessage", "Registration Error!.");
                RequestDispatcher dispatcher = request.getRequestDispatcher("signup.jsp");
                dispatcher.forward(request, response);
            }
        }                
        //processRequest(request, response);
    }
    
    // Method to send a confirmation email
    private void sendConfirmationEmail(String toEmail, String firstName) {
        String fromEmail = "minulavihanga70@gmail.com";  
        String host = "smtp.gmail.com";  // your SMTP host (e.g., smtp.gmail.com for Gmail)
        String password = "adml zbvg poer xccj";  

        // Set up properties for the SMTP server
        Properties properties = System.getProperties();
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", "587");  // Gmail SMTP port (for TLS)
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.debug", "true");

        // Create a session with the email server
        Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, password);
            }
        });

        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(fromEmail));            
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
        
            message.setSubject("Welcome to Our Website!");
            // Set the actual message (email body)
            message.setText("Dear " + firstName + ",\n\n"
                + "Welcome to our platform! We are delighted to have you as part of our community.\n\n"
                + "Your registration has been successfully completed. You can now log in and start exploring all the features and services we offer.\n\n"
                + "If you have any questions or need assistance, please feel free to contact our support team at support@ourwebsite.com. We’re here to help 24/7.\n\n"
                + "Best regards,\n"
                + "The Team at [Your Website Name]\n"
                + "Website: https://www.ourwebsite.com\n"
                + "Support Email: abc@cinema.com\n"
                + "Contact Number: 011-0000000\n");


            // Send message
            Transport.send(message);
            System.out.println("Confirmation email sent successfully to " + toEmail);
        } 
        catch (MessagingException mex) {
            mex.printStackTrace();
            
            System.out.println("Error message: " + mex.getMessage());
        }
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
