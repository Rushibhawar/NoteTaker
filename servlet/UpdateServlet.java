package com.servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryProvider;


public class UpdateServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int note_id = Integer.parseInt(request.getParameter("note_id").trim());
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		Session session = FactoryProvider.getFactory().openSession();
		Transaction tx = session.beginTransaction();
		
		Note note = (Note)session.get(Note.class, note_id);
		if(title != null) {
			note.setTitle(title);
		}
		
		if(content != null) {
			note.setContent(content);
		}
		note.setAddedDate(new Date());
		
		tx.commit();
		session.close();
		
		response.sendRedirect("AllNotes.jsp");
	}

}
