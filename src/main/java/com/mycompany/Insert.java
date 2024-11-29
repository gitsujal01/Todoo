package com.mycompany;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.module.Configuration;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.mysql.cj.xdevapi.SessionFactory;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Insert
 */
public class Insert extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public Insert() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, jakarta.servlet.http.HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	     PrintWriter pw = response.getWriter();	
	   

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter pw = response.getWriter();	
		  try {
		        String titt = request.getParameter("title");
		        String par = request.getParameter("message");
		        org.hibernate.cfg.Configuration cfg = new org.hibernate.cfg.Configuration();
		        cfg.configure();
		        org.hibernate.SessionFactory sf = cfg.buildSessionFactory();
		        Session sess = sf.openSession();
		        Todo td = new Todo();
		        td.setTitle(titt);
		        td.setMessage(par);
		        Transaction tx = sess.beginTransaction();
		        sess.save(td);
		        tx.commit();
		        sess.close();
		        response.sendRedirect("show.jsp");
		        pw.print("Inserted");
		             
	     }
		        catch(Exception e)
		        {
		        	System.out.println(e.getMessage());
		        }
	}

}
