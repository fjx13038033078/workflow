package cn.edu.ustb.dao;

import java.util.Date;
import java.util.Properties;

import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 * 发送邮件类
 * @ClassName:MailDao
 * @Description:TODO
 * @author Administrator
 * @date 2020年1月1日上午2:19:27
 *
 */
public class MailDao {
	public static String myEmailAccount = "c1111111c@163.com";            //发送者邮箱账户
	public static String myEmailPassword = "3205073fjx";           		  //发送者邮箱授权码
	
	public static String myEmailSMTPHost = "smtp.163.com";     			//163邮箱的SMTP地址
	
	/**
	* 发送邮件的具体方法
	* @Title: SendMail
	* @Description: TODO
	* @param @param receiveMailAccount
	* @param @param receiverName
	* @param @return    
	* @return boolean   
	* @throws
	 */
	public static boolean SendMail(String receiveMailAccount,String receiverName,String workflows){
		boolean flag = false;
		// 1. 创建参数配置, 用于连接邮件服务器的参数配置
        Properties props = new Properties();                    // 参数配置
        props.setProperty("mail.transport.protocol", "smtp");   // 使用的协议（JavaMail规范要求）
        props.setProperty("mail.smtp.host", myEmailSMTPHost);   // 发件人的邮箱的 SMTP 服务器地址
        props.setProperty("mail.smtp.auth", "true");            // 需要请求认证
        
        //2. 根据配置创建会话对象, 用于和邮件服务器交互
        Session session = Session.getInstance(props);
        session.setDebug(true);                                 // 设置为debug模式, 可以查看详细的发送 log

        // 3. 创建一封邮件
        MimeMessage message = null;
        Transport transport =null;
		try {
			message = createMimeMessage(session, myEmailAccount, receiveMailAccount,receiverName,workflows);
			// 4. 根据 Session 获取邮件传输对象
			transport = session.getTransport();
			//5. 使用 邮箱账号 和 密码 连接邮件服务器, 这里认证的邮箱必须与 message 中的发件人邮箱一致, 否则报错
			transport.connect(myEmailAccount, myEmailPassword);
			// 6. 发送邮件, 发到所有的收件地址, message.getAllRecipients() 获取到的是在创建邮件对象时添加的所有收件人, 抄送人, 密送人
	        transport.sendMessage(message, message.getAllRecipients());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			//出现异常直接放回false
			return flag;
		}finally{
			// 7. 关闭连接
	        try {
				transport.close();
			} catch (MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		//没有异常就更改状态
		flag = true;
		return flag;
	}
	
	/**
	* 创建邮件对象
	* @Title: createMimeMessage
	* @Description: TODO
	* @param @param session
	* @param @param sendMail
	* @param @param receiveMail
	* @param @param receiver
	* @param @return
	* @param @throws Exception    
	* @return MimeMessage   
	* @throws
	 */
	public static MimeMessage createMimeMessage(Session session, String sendMail, String receiveMail,String receiverName,String workflows) throws Exception {
        // 1. 创建一封邮件
        MimeMessage message = new MimeMessage(session);

        // 2. From: 发件人（昵称有广告嫌疑，避免被邮件服务器误认为是滥发广告以至返回失败，请修改昵称）
        message.setFrom(new InternetAddress(sendMail, "叨叨", "UTF-8"));

        // 3. To: 收件人（可以增加多个收件人、抄送、密送）
        message.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress(receiveMail, receiverName, "UTF-8"));

        // 4. Subject: 邮件主题（标题有广告嫌疑，避免被邮件服务器误认为是滥发广告以至返回失败，请修改标题）
        message.setSubject("收藏成功", "UTF-8");

        // 5. Content: 邮件正文（可以使用html标签）（内容有广告嫌疑，避免被邮件服务器误认为是滥发广告以至返回失败，请修改发送内容）
        message.setContent(receiverName+"，您好，基于您的相关信息，我们为您推荐以下工作流："+workflows, "text/html;charset=UTF-8");

        // 6. 设置发件时间
        message.setSentDate(new Date());

        // 7. 保存设置
        message.saveChanges();

        return message;
    }

}
