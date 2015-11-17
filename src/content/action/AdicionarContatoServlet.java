package content.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import content.dao.ContatoDAO;
import content.entidade.Contato;



//@WebServlet(name="adicionarContato", urlPatterns={"/html/actionForm", "/html/cadastroContato"})
@WebServlet("/html/adicionarContato")
public class AdicionarContatoServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private Contato c;
	private ContatoDAO contatoDAO = new ContatoDAO();
	private Calendar calendar;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		c = new Contato();
		
		@SuppressWarnings("unused")
		PrintWriter out = response.getWriter();
		
		c.setNome(request.getParameter("nome"));
		c.setEndereco(request.getParameter("endereco"));
		c.setEmail(request.getParameter("email"));

		try {
			Date date = new SimpleDateFormat("dd/MM/yyyy").parse(request
					.getParameter("dataNascimento"));
			calendar = Calendar.getInstance();
			calendar.setTime(date);
		} catch (ParseException e) {
			throw new RuntimeException(e);
		}

		c.setDataNascimento(calendar);

		contatoDAO.inserirContato(c);

		//out.println("Adicionado com Sucesso!");// envia mensagem p/ html
		
		//Redireciona para outro html
		RequestDispatcher rd = request.getRequestDispatcher("/html/contatoAdicionado.jsp");
		rd.forward(request,response);
	}
}
