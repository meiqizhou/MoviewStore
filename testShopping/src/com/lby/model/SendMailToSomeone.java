package com.lby.model;

public class SendMailToSomeone {

	 /**
	  * ���͵����ʼ���ָ��������
	  * @param title �ʼ����� 
	  * @param mailbody �ʼ����ݡ�һ����ҳ������ok��
	  * @param sendTo ���͸�˭ hanshunping@tsinghua.org.cn
	  * @param from ����Щ���� admin@sohu.com
	  * @param passwd ���� 123456
	  * @param sendStmp �����ʼ���smtp smtp.sohu.com [smtp.163.com] [smtp.sina.com]
	  */
	 public void send(String title,String mailbody,String sendTo,String from,String passwd,String sendStmp){
	  
	  //ָ�����Ǹ�smtpת��(�Ѻ�)
	  MysendMail themail = new MysendMail(sendStmp);
	  
	  //У������
	  themail.setNeedAuth(true);
	  
	  //�ʼ�����
	  if(themail.setSubject(title) == false) return;
	  //��Ҫ���͵� ���ݷ����ʼ��� 
	  if(themail.setBody(mailbody) == false) return;
	  
	  //���͵�����
	  if(themail.setTo(sendTo) == false) return;
	  
	  //˭���͵�
	  if(themail.setFrom(from) == false) return;
	 
	 
	 // if(themail.addFileAffix("e:\\butterfly.gif") == false) return;
	  
	   
	 // if()
	  //����sohu��վ�ϵ��ʼ��û����� ���� �����ʼ��� 
	  themail.setNamePass("lby1989825",passwd);
	  
	  //����
	  if(themail.sendout() == false) return;
	 }
	}
