package userinfo;

import java.net.Authenticator;
import java.net.PasswordAuthentication;
import java.util.Properties;

import jakarta.websocket.Session;

public class DemoMail 
{
	public static void main(String[] args) 
	{
		 // Sender's email credentials
        final String username = "your-email@gmail.com";
        final String password = "your-app-password"; // Use App Password for Gmail

        // Recipient's email
        String toEmail = "recipient@example.com";

        // SMTP server settings
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        // Create a session with authentication
        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password.toCharArray());
            }
        });

        try {
            // Compose the message
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));
            message.setRecipients(
                Message.RecipientType.TO, InternetAddress.parse(toEmail)
            );
            message.setSubject("Test Email from Java");
            message.setText("Hello, this is a test email sent from Java!");

            // Send the message
            Transport.send(message);

            System.out.println("Email sent successfully!");

        } catch (MessagingException e) {
            e.printStackTrace();
        }
	}
}
