package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryProvider;


public class SaveNoteServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			PrintWriter out = response.getWriter();
			response.setContentType("text/html");
			
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			Note note = new Note(title, content, new Date());
			
			Session session = FactoryProvider.getFactory().openSession();
			Transaction tx = session.beginTransaction();
			
			session.save(note);
			HttpSession ses = request.getSession();
			ses.setAttribute("getalert", "Yes");
			
			tx.commit();
			session.close();
			
			
			response.sendRedirect("AllNotes.jsp");
			
//			out.println("<p style='text-align:center;'>Note is saved successfully"
//					+ "</p>"
//					+ "<p style='text-align:center;'><a href='AllNotes.jsp'>View all notes"
//					+ "</a>"
//					+ "</p>");
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("inside SaveNoteServlet");
			e.printStackTrace();
		}
	}

}
