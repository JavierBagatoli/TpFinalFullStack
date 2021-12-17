package persistencia;

import java.util.List;
import logica.Empleado;
import logica.Cliente;
import logica.Paquete;
import logica.Servicio;
import logica.Venta;
import logica.exceptions.NonexistentEntityException;

public class ControladoraPersistencia {
    EmpleadoJpaController empleJPA = new EmpleadoJpaController();
    ClienteJpaController clienteJPA = new ClienteJpaController();
    ServicioJpaController servicioJPA = new ServicioJpaController();
    PaqueteJpaController paqueteJPA = new PaqueteJpaController();
    VentaJpaController ventasJPA = new VentaJpaController();
    
    public void crearEmpleado (Empleado empleado){
        empleJPA.create(empleado);
    }
    
    public List<Empleado> traerEmpleado() {
        return empleJPA.findEmpleadoEntities();
    }
    
    public void eliminarEmpleado(int id) throws NonexistentEntityException{
        empleJPA.destroy(id);
    }
    
    public Empleado buscarEmpleado(int id){
        return empleJPA.findEmpleado(id);
    }
    
    public void modificarEmpleado (Empleado emple) throws Exception{
        empleJPA.edit(emple);
    }
    
    ///Funcionamiento Cliente
    
    public void crearCliente(Cliente cliente){
        clienteJPA.create(cliente);
    }
    
    public List<Cliente> traerClientes() {
        return clienteJPA.findClienteEntities();
    }
    
    public void eliminarCliente(int id) throws persistencia.exceptions.NonexistentEntityException {
        clienteJPA.destroy(id);
    }
    public Cliente buscarCliente(int id){
        return clienteJPA.findCliente(id);
    }
        
    public void modificarCliente (Cliente cliente) throws Exception{
        clienteJPA.edit(cliente);
    }
    
    ///Funcionamiento de Servicios
    
    public void crearServicio(Servicio servicio){
        servicioJPA.create(servicio);
    }
    public List<Servicio> traerServicios(){
        return servicioJPA.findServicioEntities();
    }
    
    public Servicio buscarServicio(int id){
        return servicioJPA.findServicio(id);
    }

    public void modificarServicio(Servicio servicio) throws Exception {
        servicioJPA.edit(servicio);
    }
    //Funcionamiento de paquetes
    public void crearPaquete(Paquete paquete){
        paqueteJPA.create(paquete);
    }
    
    public List<Paquete> traerPaquetes(){
        return paqueteJPA.findPaqueteEntities();
    }
    
    public Paquete buscarPaquete(int id){
        return paqueteJPA.findPaquete(id);
    }
    
    public void modificarPaquete(Paquete paquete) throws Exception{
        paqueteJPA.edit(paquete);
    }

    public void bajaPaquete(Paquete paquete) throws Exception {
        paqueteJPA.edit(paquete);
    }

    //Funcionamiento de Ventas
    public void crearVenta(Venta venta) {
        ventasJPA.create(venta);
    }

    public List<Venta> traerVentas() {
        return ventasJPA.findVentaEntities();
    }

    public Venta buscarVenta(int id) {
        return ventasJPA.findVenta(id);
    }

    public void modificarVenta(Venta venta) throws Exception {
        ventasJPA.edit(venta);
    }

    public void bajaVenta(Venta venta) throws persistencia.exceptions.NonexistentEntityException {
        ventasJPA.destroy(venta.getNum_vante());
    }
}
