package logica;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Paquete implements Serializable {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int id_paquete;
    @Basic
    private String codigo_paquete;
    private int costo_paquete;
    private boolean estado_paquete;
    
    @OneToMany
    private List<Servicio> lista_servicios_incluidos;

    public int getId_paquete() {
        return id_paquete;
    }

    public void setId_paquete(int id_paquete) {
        this.id_paquete = id_paquete;
    }

    public String getCodigo_paquete() {
        return codigo_paquete;
    }

    public void setCodigo_paquete(String codigo_paquete) {
        this.codigo_paquete = codigo_paquete;
    }

    public int getCosto_paquete() {
        return costo_paquete;
    }

    public void setCosto_paquete(int costo_paquete) {
        this.costo_paquete = costo_paquete;
    }

    public boolean isEstado_paquete() {
        return estado_paquete;
    }

    public void setEstado_paquete(boolean estado_paquete) {
        this.estado_paquete = estado_paquete;
    }

    public List<Servicio> getLista_servicios_incluidos() {
        return lista_servicios_incluidos;
    }

    public void setLista_servicios_incluidos(List<Servicio> lista_servicios_incluidos) {
        this.lista_servicios_incluidos = lista_servicios_incluidos;
    }

    public Paquete() {
    }

    public Paquete(int id_paquete, String codigo_paquete, int costo_paquete, boolean estado_paquete, List<Servicio> lista_servicios_incluidos) {
        this.id_paquete = id_paquete;
        this.codigo_paquete = codigo_paquete;
        this.costo_paquete = costo_paquete;
        this.estado_paquete = estado_paquete;
        this.lista_servicios_incluidos = lista_servicios_incluidos;
    }
    
        
}
