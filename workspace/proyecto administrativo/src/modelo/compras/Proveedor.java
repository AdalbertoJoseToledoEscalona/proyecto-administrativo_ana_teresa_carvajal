/**
 * 
 */
package modelo.compras;

import java.util.Date;

import modelo.empresas.Empresa;
import modelo.personas.Persona;

/**
 * @author adalberto
 *
 */
public class Proveedor {

	private Persona persona;
	private Empresa empresa;
	/**
	 * El identificador
	 */
	private int id;
	/**
	 * Fecha Creacion
	 */
	private Date fechaHora;

	/**
	 * 
	 */
	public Proveedor() {
		empresa = new Empresa();
		// TODO Auto-generated constructor stub
		persona = new Persona();
	}

}
