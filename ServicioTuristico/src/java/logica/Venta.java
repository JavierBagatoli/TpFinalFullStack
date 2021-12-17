package logica;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;


@Entity
public class Venta implements Serializable {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int num_vante;
    @Basic
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date fecha_venta;
    private String medio_pago;
    
    @OneToOne
    private Paquete paquete;
    @OneToOne
    private Empleado empleado;
    @OneToOne
    private Cliente cliente;
    @OneToMany
    private List<Servicio> servicios;

    public int getNum_vante() {
        return num_vante;
    }

    public Empleado getEmpleado() {
        return empleado;
    }

    public void setEmpleado(Empleado empleado) {
        this.empleado = empleado;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public void setNum_vante(int num_vante) {
        this.num_vante = num_vante;
    }

    public Date getFecha_venta() {
        return fecha_venta;
    }

    public void setFecha_venta(Date fecha_venta) {
        this.fecha_venta = fecha_venta;
    }

    public String getMedio_pago() {
        return medio_pago;
    }

    public void setMedio_pago(String medio_pago) {
        this.medio_pago = medio_pago;
    }

    public Paquete getPaquete() {
        return paquete;
    }

    public void setPaquete(Paquete paquete) {
        this.paquete = paquete;
    }

    public List<Servicio> getServicios() {
        return servicios;
    }

    public void setServicios(List<Servicio> servicios) {
        this.servicios = servicios;
    }

    public Venta() {
    }

    public Venta(int num_vante, Date fecha_venta, String medio_pago, Paquete paquete, Empleado empleado, Cliente cliente, List<Servicio> servicios) {
        this.num_vante = num_vante;
        this.fecha_venta = fecha_venta;
        this.medio_pago = medio_pago;
        this.paquete = paquete;
        this.empleado = empleado;
        this.cliente = cliente;
        this.servicios = servicios;
    }

    
}
