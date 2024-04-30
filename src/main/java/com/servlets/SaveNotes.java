package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entity.Note;
import com.helper.FactoryProvider;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
/**
 * Servlet implementation class SaveNotes
 */
public class SaveNotes extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public SaveNotes() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			//title and content fetch
			String title = request.getParameter("title");
			String content = request.getParameter("Content");
			
			Note note = new Note(title,content, new Date());
			//hibernate : save()
			System.out.println("This is id "+ note.getId());
			Session s = FactoryProvider.getFactory().openSession();	
			
			Transaction tx = s.beginTransaction();
			
			s.save(note);
			tx.commit();			
			s.close();
			response.setContentType("text/html");
			PrintWriter out =response.getWriter();
			out.println("<h1 style ='text-align:center;'> Note is Added </h1>");
			out.println("<h1 style ='text-align:center;'> <a href='all_notes.jsp'>View all Notes</a> </h1>");
		}catch(Exception e) {
			e.printStackTrace();
		}
		doGet(request, response);
	}

}
