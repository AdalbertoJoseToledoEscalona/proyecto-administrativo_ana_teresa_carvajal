/**
 * 
 */
package modelo.ventas;

import java.util.Date;

import modelo.empresas.Empresa;
import modelo.personas.Persona;

/**
 * @author adalberto
 *
 */
public class Cliente {

	private Empresa empresa;
	private Persona persona;
	/**
	 * El identificador del cliente en la empresa
	 */
	private int id;
	/**
	 * Fecha Hora de la creación del cliente
	 */
	private Date fechaHora;

	/**
	 * 
	 */
	public Cliente() {
		persona = new Persona();
		// TODO Auto-generated constructor stub
		empresa = new Empresa();
	}

}
