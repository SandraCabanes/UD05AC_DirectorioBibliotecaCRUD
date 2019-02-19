package ejemplo03.dominio;
// Generated 19-feb-2019 10:11:28 by Hibernate Tools 4.3.1



/**
 * Biblioteca generated by hbm2java
 */
public class Biblioteca  implements java.io.Serializable {


     private Integer idBiblioteca;
     private Municipio municipio;
     private String tipo;
     private String nombre;
     private String direccion;
     private String codPostal;
     private String telefono;
     private String web;
     private String email;
     private String catalogo;

    public Biblioteca() {
    }

    public Biblioteca(Municipio municipio, String tipo, String nombre, String direccion, String codPostal, String telefono, String web, String email, String catalogo) {
       this.municipio = municipio;
       this.tipo = tipo;
       this.nombre = nombre;
       this.direccion = direccion;
       this.codPostal = codPostal;
       this.telefono = telefono;
       this.web = web;
       this.email = email;
       this.catalogo = catalogo;
    }
   
    public Integer getIdBiblioteca() {
        return this.idBiblioteca;
    }
    
    public void setIdBiblioteca(Integer idBiblioteca) {
        this.idBiblioteca = idBiblioteca;
    }
    public Municipio getMunicipio() {
        return this.municipio;
    }
    
    public void setMunicipio(Municipio municipio) {
        this.municipio = municipio;
    }
    public String getTipo() {
        return this.tipo;
    }
    
    public void setTipo(String tipo) {
        this.tipo = tipo;
    }
    public String getNombre() {
        return this.nombre;
    }
    
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public String getDireccion() {
        return this.direccion;
    }
    
    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }
    public String getCodPostal() {
        return this.codPostal;
    }
    
    public void setCodPostal(String codPostal) {
        this.codPostal = codPostal;
    }
    public String getTelefono() {
        return this.telefono;
    }
    
    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }
    public String getWeb() {
        return this.web;
    }
    
    public void setWeb(String web) {
        this.web = web;
    }
    public String getEmail() {
        return this.email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    public String getCatalogo() {
        return this.catalogo;
    }
    
    public void setCatalogo(String catalogo) {
        this.catalogo = catalogo;
    }




}

