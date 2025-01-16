package com.example.socialmedia.service;

import java.util.Map;
import java.util.Properties;

import com.example.socialmedia.repository.ConfigurazioneRepository;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

@ApplicationScoped
public class EmailService {

    @Inject
    ConfigurazioneRepository configurazioneRepository;

    public void sendEmail(String recipient, String subject, String body) throws MessagingException {
        // Recupero configurazioni dal database
        String configurazioneValore = "Configurazione invio email";
        Integer groupId = configurazioneRepository.findIdByValore(configurazioneValore); // ID del gruppo 'Invio email'
        Map<String, String> configurations = configurazioneRepository.getConfigurationsByGroupId(groupId);

        System.out.println("Configurazioni recuperate:");
        configurations.forEach((key, value) -> System.out.println(key + ": " + value));

        // Estrazione dei valori
        String sender = configurations.get("sender");
        String smtpHost = configurations.get("smtpHost");
        int smtpPort = Integer.parseInt(configurations.get("smtpPort"));
        String smtpPassword = configurations.get("password");
        boolean smtpAuth = Boolean.parseBoolean(configurations.get("smtpAuth"));
        boolean smtpStarttlsEnable = Boolean.parseBoolean(configurations.get("smtpStarttlsEnable"));
        boolean smtpSslTrust = Boolean.parseBoolean(configurations.get("smtpSslTrust"));

        // Configurazione SMTP
        Properties props = new Properties();
        props.put("mail.smtp.host", smtpHost);
        props.put("mail.smtp.port", smtpPort);
        props.put("mail.smtp.auth", String.valueOf(smtpAuth));
        props.put("mail.smtp.starttls.enable", String.valueOf(smtpStarttlsEnable));
        props.put("mail.smtp.ssl.trust", smtpSslTrust ? smtpHost : "");

        // Autenticazione SMTP
        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(sender, smtpPassword);
            }
        });

        // Creazione del messaggio
        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(sender));
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipient));
        message.setSubject(subject);
        message.setText(body);

        // Invio
        Transport.send(message);
    }
}