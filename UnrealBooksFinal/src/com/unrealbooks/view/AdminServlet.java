package com.unrealbooks.view;

import java.io.*;
import java.sql.*;
import java.util.*;
import java.security.*;
import javax.servlet.*;
import javax.xml.bind.DatatypeConverter;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import freemarker.template.*;
import javax.mail.*;
import javax.mail.internet.*;
import com.unrealbooks.controller.*;
import com.unrealbooks.model.*;
import com.unrealbooks.database.*;

@WebServlet("/admin")
public class AdminServlet extends BaseServlet
{
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {

	try
	    {
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");

            HttpSession session = request.getSession();
            synchronized(session){}
            map.put("user", session.getAttribute("user"));
            map.put("error",false);

	    //add customer
	    String name1=request.getParameter("name1");
	    String email1=request.getParameter("email1");
	    String sel1=request.getParameter("sel1");
	    String password1=request.getParameter("password1");
	    String shipping1=request.getParameter("shipping1");
	    String phone1=request.getParameter("phone1");
	    String card1=request.getParameter("card1");
	    String billing1=request.getParameter("billing1");
	    String type1=request.getParameter("type1");
	    String cardexp1=request.getParameter("cardexp1");
	    String ccv1=request.getParameter("ccv1");
	    String sub1=request.getParameter("sub1");
	    //update customer
	    String cusid1=request.getParameter("cusid1");
	    String name2=request.getParameter("name2");
	    String email2=request.getParameter("email2");
	    String sel2=request.getParameter("sel2");
	    String password2=request.getParameter("password2");
	    String shipping2=request.getParameter("shipping2");
	    String phone2=request.getParameter("phone2");
	    String card2=request.getParameter("card2");
	    String billing2=request.getParameter("billing2");
	    String type2=request.getParameter("type2");
	    String cardexp2=request.getParameter("cardexp2");
	    String ccv2=request.getParameter("ccv2");
	    String sub2=request.getParameter("sub2");
	    //delete customer
	    String customerlist=request.getParameter("customerlist");
	    //add book
	    String title1=request.getParameter("name1");
	    String isbn1=request.getParameter("ID1");
	    String category1=request.getParameter("category1");
	    String author1=request.getParameter("company1");
	    String cover1=request.getParameter("cover1");
	    String threshold1=request.getParameter("threshold1");
	    String sellingp1=request.getParameter("sellingp1");
	    String buyingp1=request.getParameter("buyingp1");

	    //restock
	    String isbn2=request.getParameter("ID2");
	    String adding=request.getParameter("add");
	    //edit book
	    String title2=request.getParameter("name2");
	    String isbn3=request.getParameter("ID3");
	    String category2=request.getParameter("category2");
	    String author2=request.getParameter("company2");
	    String cover2=request.getParameter("cover2");
	    String threshold2=request.getParameter("threshold2");
	    String sellingp2=request.getParameter("sellingp2");
	    String buyingp2=request.getParameter("buyingp2");
	    //delete book
	    String booklist=request.getParameter("booklist");
	    //add employee
	    String name4=request.getParameter("name4");
	    String email4=request.getParameter("email4");
	    String password4=request.getParameter("password4");
	    String shipping4=request.getParameter("shipping4");
	    String phone4=request.getParameter("phone4");
	    String type111=request.getParameter("type111");
	    //update employee
	    String employeeid=request.getParameter("employeeid");
	    String name5=request.getParameter("name5");
	    String email5=request.getParameter("email5");
	    String password5=request.getParameter("password5");
	    String shipping5=request.getParameter("shipping5");
	    String phone5=request.getParameter("phone5");
	    String type222=request.getParameter("type222");
	    //delete employee
	    String employeelist=request.getParameter("employeelist");
	    //add Promotion
	    String code1=request.getParameter("code1");
	    String expire1=request.getParameter("expire1");
	    String val1=request.getParameter("val1");
	    //update Promotion
	    String code2=request.getParameter("code2");
	    String expire2=request.getParameter("expire2");
	    String val2=request.getParameter("val2");
	    //delete promotion
	    String codelist=request.getParameter("codelist");
	    User user =null;
	    Item book=null;
	    Promotion promotion=null;
	    //add shipping agency
	    String shipid1=request.getParameter("shipid1");
	    String shipname1=request.getParameter("shipname1");
	    String shipphone1=request.getParameter("shipphone1");
	    String shipadd1=request.getParameter("shipadd1");
	    String cname1=request.getParameter("cname1");
	    String shipem1=request.getParameter("shipem1");
	    String cphone1=request.getParameter("cphone1");
	    String bphone1=request.getParameter("bphone1");
	    //update shipping agency
	    String shipid2=request.getParameter("shipid2");
            String shipname2=request.getParameter("shipname2");
            String shipphone2=request.getParameter("shipphone2");
            String shipadd2=request.getParameter("shipadd2");
            String cname2=request.getParameter("cname2");
            String shipem2=request.getParameter("shipem2");
            String cphone2=request.getParameter("cphone2");
            String bphone2=request.getParameter("bphone2");
	    //delete shipping agency
	    String shiplist=request.getParameter("shiplist");
	    //create supplier company
	    String supplyid1=request.getParameter("supplyid1");
	    String supplyname1=request.getParameter("supplyname1");
	    String supplyphone1=request.getParameter("supplyphone1");
	    String supplyadd1=request.getParameter("supplyadd1");
	    String supplycname1=request.getParameter("supplycname1");
	    String supplyem1=request.getParameter("supplyem1");
	    String supplycphone1=request.getParameter("supplycphone1");
	    String supplybphone1=request.getParameter("supplybphone1");
	    //update supplier company
	    String supplyid2=request.getParameter("supplyid2");
            String supplyname2=request.getParameter("supplyname2");
            String supplyphone2=request.getParameter("supplyphone2");
            String supplyadd2=request.getParameter("supplyadd2");
            String supplycname2=request.getParameter("supplycname2");
            String supplyem2=request.getParameter("supplyem2");
            String supplycphone2=request.getParameter("supplycphone2");
            String supplybphone2=request.getParameter("supplybphone2");
	    //delete supplier company
	    String supplierlist=request.getParameter("supplierlist");

            if(name1!=null&&!name1.equals(""))
		{
		    MessageDigest messageDigest = MessageDigest.getInstance("SHA-256");
		    messageDigest.update(password1.getBytes());
		    password1 = DatatypeConverter.printHexBinary(messageDigest.digest());
		    User.Status temp=User.Status.WAITING;
		    switch (sel1)
			{
			case "active":
			    temp=User.Status.ACTIVE;
			    break;
			case "suspended":
			    temp=User.Status.SUSPENDED;
			    break;
			default:
			    temp=User.Status.WAITING;
			    break;
			}
		    User.Subscribed s=User.Subscribed.YES;
		    if(sub1==null) s=User.Subscribed.NO;
		    user=controller.createUser(0, User.Type.CUSTOMER, name1,password1, Integer.parseInt(phone1),shipping1, temp, email1, "NULL",s);
		    if(card1!=null&&!card1.equals(""))
			{

                            Payment.Type t=Payment.Type.DEBIT;
			    switch(type1)
                                {
                                case "credit":
                                    t=Payment.Type.CREDIT;
                                    break;
                                }
			    controller.createPaymentM(user.getUserId(), card1, billing1, t, cardexp1, Integer.parseInt(ccv1));
			}
		}
            else if(name2!=null&&!name2.equals(""))
		{
		    System.out.println("password: "+password2);
		    MessageDigest messageDigest = MessageDigest.getInstance("SHA-256");
		    messageDigest.update(password2.getBytes());
		    password2 = DatatypeConverter.printHexBinary(messageDigest.digest());
		    User.Status temp=User.Status.WAITING;
                    switch (sel2)
                        {
                        case "active":
			    {
                            temp=User.Status.ACTIVE;
                            break;}
                        case "suspended":
			    {
			    System.out.println("suspended");
                            temp=User.Status.SUSPENDED;
                            break;}
                        default:{
                            temp=User.Status.WAITING;
                            break;}
                        }
		    User.Subscribed s=User.Subscribed.YES;
                    if(sub1==null) s=User.Subscribed.NO;
		    user=controller.updateUserM(Integer.parseInt(cusid1), User.Type.CUSTOMER, name2, password2, Integer.parseInt(phone2),shipping2, temp, email2, "NULL",s);

		    if(card2!=null&&!card2.equals(""))
                        {
			    Payment.Type t=Payment.Type.DEBIT;
			    switch(type2)
				{
				case "credit":
				    t=Payment.Type.CREDIT;
				    break;
				}
			    controller.updatePaymentM(Integer.parseInt(cusid1),card2, billing2, t, cardexp2, Integer.parseInt(ccv2));
                        }
            }
            else if(customerlist!=null&&!customerlist.equals(""))
		{
		    map.put("user1",false);
		    controller.deleteUser(Integer.parseInt(customerlist));
		    controller.deletePaymentM(Integer.parseInt(customerlist));
		}
            else if(isbn1!=null&&!isbn1.equals(""))
		{
		   // System.out.println(isbn1+" "+category1+" "+author1+" "+title1+" "+cover1+" "+edition1+" "+publisher1+" "+publicyear1+" "+buyingp1+" "+threshold1+" "+sellingp1+" ");
		    book=controller.createBook(isbn1,category1,author1,title1,cover1,Integer.parseInt(buyingp1),Integer.parseInt(threshold1),Double.parseDouble(sellingp1));
		}
            else if(isbn2!=null&&!isbn2.equals(""))
		{
		    controller.restock(isbn2,Integer.parseInt(adding));
		}
            else if(isbn3!=null&&!isbn3.equals(""))
		{
		    book=controller.updateBook(isbn3,category2,author2,title2,cover2,Integer.parseInt(buyingp2), Integer.parseInt(threshold2),Double.parseDouble(sellingp2));
		}
            else if(booklist!=null&&!booklist.equals(""))
		{
		    controller.deleteBook(booklist);
		}
            else if(name4!=null&&!name4.equals(""))
		{
		    MessageDigest messageDigest = MessageDigest.getInstance("SHA-256");
                    messageDigest.update(password4.getBytes());
                    password4 = DatatypeConverter.printHexBinary(messageDigest.digest());

		    User.Type temp=User.Type.BUSINESS;
                    switch (type111)
                        {
                        case "shipping":
                            temp=User.Type.SHIPPING;
                            break;
                        default:
                            break;
                        }

		    user=controller.createUser(0, temp,name4,password4,Integer.parseInt(phone4),shipping4, User.Status.ACTIVE, email4,"NULL", User.Subscribed.NO);
		}
            else if(employeeid!=null&&!employeeid.equals(""))
		{
		    MessageDigest messageDigest = MessageDigest.getInstance("SHA-256");
                    messageDigest.update(password5.getBytes());
                    password5 = DatatypeConverter.printHexBinary(messageDigest.digest());
		    User.Type temp=User.Type.BUSINESS;
                    switch (type222)
                        {
                        case "shipping":
                            temp=User.Type.SHIPPING;
                            break;
                        default:
                            break;
                        }

		    user=controller.updateUserM(Integer.parseInt(employeeid),temp, name5,password5,Integer.parseInt(phone5),shipping5, User.Status.ACTIVE, email5,"NULL",User.Subscribed.NO);
		}
            else if(employeelist!=null&&!employeelist.equals(""))
		{
		    System.out.println("id: "+employeelist);
		    controller.deleteUser(Integer.parseInt(employeelist));
		}
            else if(expire1!=null&&!expire1.equals(""))
		{

		    java.sql.Date d=new java.sql.Date(Integer.parseInt(expire1.substring(6))-1900, Integer.parseInt(expire1.substring(0,2))-1,Integer.parseInt(expire1.substring(3,5)));

		    promotion=controller.createPromotion(code1, d, Integer.parseInt(val1));
		    controller.EmailNewPromo(promotion);
		}
            else if(expire2!=null&&!expire2.equals(""))
		{
		    java.sql.Date d=new java.sql.Date(Integer.parseInt(expire2.substring(6))-1900,
						      Integer.parseInt(expire2.substring(0,2))-1,
						      Integer.parseInt(expire2.substring(3,5)));
		    promotion=controller.updatePromotion(code2,d,Integer.parseInt(val2));
		    controller.EmailUpdatedPromo(promotion);
		}
            else if(codelist!=null&&!codelist.equals(""))
		{
		    controller.deletePromotion(codelist);
		}
	    else if(shipid1!=null&&!shipid1.equals(""))
		{
		    controller.createShipment(Integer.parseInt(shipid1), shipname1, shipphone1, shipadd1, cname1, shipem1, cphone1, bphone1);
		}
	    else if(shipid2!=null&&!shipid2.equals(""))
		{
		    controller.updateShipment(Integer.parseInt(shipid2), shipname2, shipphone2, shipadd2, cname2, shipem2, cphone2, bphone2);
		}
	    else if(shiplist!=null&&!shiplist.equals(""))
		{
		    controller.deleteShipment(Integer.parseInt(shiplist));
		}
	    else if(supplyid1!=null&&!supplyid1.equals(""))
		{
		    controller.createSupplier(Integer.parseInt(supplyid1), supplyname1, supplyphone1, supplyadd1, supplycname1, supplyem1, supplycphone1, supplybphone1);
		}
	    else if(supplyid2!=null&&!supplyid2.equals(""))
		{
		    controller.updateSupplier(Integer.parseInt(supplyid2), supplyname2, supplyphone2, supplyadd2, supplycname2, supplyem2, supplycphone2, supplybphone2);
		}
	    else if(supplierlist!=null&&!supplierlist.equals(""))
		{
		    controller.deleteSupplier(Integer.parseInt(supplierlist));
		}
            else
		{
		    map.put("error", true);
		}


            Template template=cfg.getTemplate("admin.ftl");
            template.process(map,out);
	    }
	catch(Exception e)
	    {
		e.printStackTrace();
	    }
    }


}
