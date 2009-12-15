package beans;

import java.util.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import daos.UsuarioDAO;

@Entity
@Table(name = "evento")   
public class Evento {
	
	@Id
	@SequenceGenerator(name = "evento_id_seq", sequenceName = "evento_id_seq", allocationSize=1)
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="evento_id_seq")
	private Integer id;

	@Column(nullable = false)
	private String nome;

	@Column
	private Date data;

	@Column
	private String descricao;

	@Column
	private String responsavel;
	
	@ManyToMany(
		cascade={CascadeType.PERSIST, CascadeType.MERGE},
		targetEntity = Usuario.class
	)
	@JoinTable(
		name="Evento_Usuario",
		joinColumns=@JoinColumn(name="id"),
		inverseJoinColumns=@JoinColumn(name="login")
	)
	private Set<Usuario> usuarios;
	
	public Set<Usuario> getUsuarios() {
		return usuarios;
	}
	
	public void setUsuario(Set<Usuario> usuarios) {
		this.usuarios = usuarios;
	}
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public Date getData() {
		return data;
	}

	public void setData(Date data) {
		this.data = data;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public String getResponsavel() {
		return responsavel;
	}

	public void setResponsavel(String responsavel) {
		this.responsavel = responsavel;
	}

	public String getUsuarioInscrito(){
		Usuario u;
		HttpServletRequest request;
		HttpSession session;
		request = ServletActionContext.getRequest();
		session = request.getSession();
		String tmpLogin = (String) session.getAttribute("login");
		ApplicationContext ctxUsuario;
		UsuarioDAO daoUsuario;
		ctxUsuario = new ClassPathXmlApplicationContext(new String[] { "applicationContext.xml" });
		daoUsuario = (UsuarioDAO) ctxUsuario.getBean("usuarioDAO");
		u=daoUsuario.selectByLogin(tmpLogin);
		
		if (u!=null){
			if (this.getUsuarios()!=null){
				return (this.getUsuarios().contains(u))?"true":"false";
			}
		}
		return "false";
	}
	
}
