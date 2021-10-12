package org.craftercms.sites.editorial

import org.craftercms.commons.mail.EmailFactory
import org.craftercms.engine.service.context.SiteContext

import java.util.Properties

import org.craftercms.commons.mail.impl.EmailFactoryImpl
import org.craftercms.engine.exception.HttpStatusCodeException
import org.springframework.mail.javamail.JavaMailSenderImpl

class MailService {

    def mailSender = new JavaMailSenderImpl()
    def emailFactory = new EmailFactoryImpl()
    def javaMailProperties = new Properties()
    
		
    def MailService() {
        mailSender.setHost("smtp.gmail.com")
		mailSender.setPort(587)
		mailSender.setUsername("online.mavinfood@gmail.com")
		mailSender.setPassword("zjqhidqutntdsyog")
		
		javaMailProperties["mail.transport.protocol"] = "smtp"
        javaMailProperties["mail.smtp.auth"] = "false"
        javaMailProperties["mail.smtp.starttls.enable"] = "true"
        mailSender.javaMailProperties = javaMailProperties
        emailFactory.mailSender = mailSender
    }

    def setHost(host) {
        mailSender.host = host
    }

    def setPort(port) {
        mailSender.port = Integer.parseInt(port)
    }

    def setProtocol(protocol) {
        mailSender.protocol = protocol
    }

    def setEncoding(encoding) {
        mailSender.defaultEncoding = encoding
    }

    def sendEmail(from, to, cc, subject, templateName, templateModel) {
        emailFactory.freeMarkerConfig = SiteContext.current.freeMarkerConfig.configuration
        println("SENDING EMAIL")
        if (cc != null) {
            emailFactory.getEmail(from, to.split("[,\\s]+"), cc.split("[,\\s]+"), null, subject, templateName, templateModel, true).send()
        } else {
            emailFactory.getEmail(from, to.split("[,\\s]+"), null, null, subject, templateName, templateModel, true).send()
        }
    }

    def sendEmail(from, to, cc, subject, body) {
        println("SENDING EMAIL")
        emailFactory.freeMarkerConfig = SiteContext.current.freeMarkerConfig.configuration
        if (cc != null) {
            emailFactory.getEmail(from, to.split("[,\\s]+"), cc.split("[,\\s]+"), null, subject, body, true).send()
        } else {
            emailFactory.getEmail(from, to.split("[,\\s]+"), null, null, subject, body, true).send()
        }
    }
}