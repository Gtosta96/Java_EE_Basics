package content.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import content.entidade.Contato;

/**
 * Classe que faz CRUD (persistência) na tabela Contatos
 * 
 * @author Gabriel
 * @see Contato
 */
public class ContatoDAO {
	
	private Connection connection;
	private PreparedStatement ps;
	private String sql;
	private Contato contato;

	public ContatoDAO() {
		this.connection = new ConnectionFactory().getConnection();

		try {
			Class.forName("org.postgresql.driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
	}

	public void inserirContato(Contato c) {

		sql = "INSERT INTO CONTATOS (NOME, ENDERECO, EMAIL, DATANASCIMENTO) VALUES (?, ?, ?, ?)";
		try {
			ps = connection.prepareStatement(sql);
			ps.setString(1, c.getNome());
			ps.setString(2, c.getEndereco());
			ps.setString(3, c.getEmail());
			ps.setDate(4, new Date(c.getDataNascimento().getTimeInMillis()));

			ps.execute();
			ps.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public List<Contato> getLista() {
		List<Contato> contatos = new ArrayList<Contato>();

		try {
			sql = "SELECT * FROM CONTATOS";
			ps = connection.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				contato = new Contato();

				contato.setId(rs.getInt("id"));
				contato.setNome(rs.getString("nome"));
				contato.setEmail(rs.getString("email"));
				contato.setEndereco(rs.getString("endereco"));

				Calendar calendar = Calendar.getInstance();
				calendar.setTime(rs.getDate("dataNascimento"));

				contato.setDataNascimento(calendar);

				contatos.add(contato);
			}
			rs.close();
			ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return contatos;
	}
}