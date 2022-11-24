package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryProvider;

public class DeleteServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int note_id = Integer.parseInt(request.getParameter("note_id").trim());
		
		Session session = FactoryProvider.getFactory().openSession();
		Transaction tx = session.beginTransaction();
		Note note = (Note)session.get(Note.class, note_id);
		session.delete(note);
		tx.commit();
		
		response.sendRedirect("AllNotes.jsp");
		
		session.close();
		
	}


}
