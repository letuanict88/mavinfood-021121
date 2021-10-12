import org.craftercms.sites.editorial.MailService

println "Processing Contact Us Request with values:"
println params

def service = new MailService()
// SMTP server information:
service.setHost('smtp.gmail.com')
service.setPort('587')
service.setEncoding('utf-8')

service.sendEmail(params.email, "contact@mavinfood.com", null, 
                  params.title ,"<strong>Họ Tên: </strong>" + params.name + "<br/>" + "<strong>Email: </strong>" + params.email +"<br/>" + "<strong>Số điện thoại: </strong>" 
                  + params.phone + "<br/>" +"<strong>Tên công ty: </strong>" 
                  + params.company + "<br/>" + "<strong>Nội dung: </strong>" + params.content)


def result=[:]
result.success = true
return result