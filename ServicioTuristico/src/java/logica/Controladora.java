package logica;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import logica.exceptions.NonexistentEntityException;
import persistencia.ControladoraPersistencia;

public class Controladora {
    ControladoraPersistencia controlPersis = new ControladoraPersistencia();
    
    
    //Funcionamiento del Login
    
    public boolean  verificarUsuario(String email, String password){
        List<Cliente> listaCliente = controlPersis.traerClientes();
        List<Empleado> listaEmpleado = controlPersis.traerEmpleado();

        if (listaEmpleado != null){
            for(Empleado empleado : listaEmpleado){
                if (empleado.getEmail().equals(email) && empleado.getPassword().equals(password)){
                    return true;
                }
            }
        }
        
        if (listaCliente != null){
            for(Cliente cliente : listaCliente){
                if (cliente.getEmail().equals(email) && cliente.getPassword().equals(password)){
                    return true;
                }
            }
        }
        
        return false;         
    }
    
    //Funcionamiento de empleado
    
    public void crearEmpleado(String nombre,String apellido,String direccion,String  dni,String  nacionalidad,String  celular,String  email,String  cargo,String  salario, String password) {
        Empleado empleado = new Empleado();
        empleado.setNombre(nombre);
        empleado.setApellido(apellido);
        empleado.setDireccion(direccion);
        empleado.setDni(dni);
        empleado.setNacionalidad(nacionalidad);
        empleado.setCelular(celular);
        empleado.setEmail(email);
        empleado.setCargo(cargo);
        empleado.setSalario(salario);
        empleado.setPassword(password);
        
        controlPersis.crearEmpleado(empleado);
    }
    
    public List<Empleado> traerEmpleado(){
        return controlPersis.traerEmpleado();
    }

    public void eliminarEmpleado(int id) throws NonexistentEntityException, Exception{
        List<Venta> listaVentas = traerVentas();
        for(Venta listaVenta : listaVentas){
            Integer ventaIdEmpleado;
            try{
                ventaIdEmpleado = listaVenta.getEmpleado().getId_Empleado();
            }catch(NullPointerException e){
                ventaIdEmpleado = 0;}
            Integer idEmpelado = id;
            if (ventaIdEmpleado == idEmpelado )
                {Venta ventaActu = controlPersis.buscarVenta(listaVenta.getNum_vante());
                 ventaActu.setEmpleado(null);
                 
                 controlPersis.modificarVenta(ventaActu);
                }
        }
        
        
        controlPersis.eliminarEmpleado(id);
    }
    
    public Empleado buscarEmpleado(int id){
        return controlPersis.buscarEmpleado(id);
    }
    
    public void modificarEmpleado (Empleado emple) throws Exception{
        controlPersis.modificarEmpleado(emple);
    }
    
    ///Funcionamiento sobre cliente
    
    public void crearCliente(String nombre,String apellido,String direccion,String  dni,String  nacionalidad,String  celular,String  email, String password, Date nacimiento) {
        Cliente cliente = new Cliente();
        cliente.setNombre(nombre);
        cliente.setApellido(apellido);
        cliente.setDireccion(direccion);
        cliente.setDni(dni);
        cliente.setNacionalidad(nacionalidad);
        cliente.setNumeroCelular(celular);
        cliente.setEmail(email);
        cliente.setPassword(password);
        cliente.setFechaNacimiento(nacimiento);
        
        controlPersis.crearCliente(cliente);
    }
    
    public List<Cliente> traerClientes(){
        return controlPersis.traerClientes();
    }

    public void eliminarCliente(int id) throws NonexistentEntityException, Exception{
        List<Venta> listaVentas = traerVentas();
        for(Venta listaVenta : listaVentas){
            Integer ventaIdCliente;
            try{
                ventaIdCliente = listaVenta.getCliente().getId_Persona();
            }catch(NullPointerException e){
                ventaIdCliente = 0;}
            Integer idCliente = id;
            if (ventaIdCliente == idCliente )
                {Venta ventaActu = controlPersis.buscarVenta(listaVenta.getNum_vante());
                 ventaActu.setCliente(null);

                 controlPersis.modificarVenta(ventaActu);
                }
        }
        
        try {
            controlPersis.eliminarCliente(id);
        } catch (persistencia.exceptions.NonexistentEntityException ex) {
            Logger.getLogger(Controladora.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public Cliente buscarCliente(int id){
        return controlPersis.buscarCliente(id);
    }
    
    public void modificarCliente (Cliente cliente) throws Exception{
        controlPersis.modificarCliente(cliente);
    }
    ///Funcionamiento sobre servicios
    
    public void crearServicio(String tipo, String nombre, String descripcion, String destino, int coste){
        Servicio servicio = new Servicio();
        servicio.setTipo_servicio(tipo);
        servicio.setNombre(nombre);
        servicio.setDescripcion_breve(descripcion);
        servicio.setDestino_servicio(destino);
        servicio.setCosto_servicio(coste);
        servicio.setEstado(true);
        servicio.setFecha_servicio(new Date());
        controlPersis.crearServicio(servicio);
    }
    
    public List<Servicio> traerServicios(){
        return controlPersis.traerServicios();
    }
    
    public Servicio buscarServicio(int id){
        return controlPersis.buscarServicio(id);
    }

    public void modificarServicio(Servicio servicio) throws Exception{
        controlPersis.modificarServicio(servicio);
    }
    
    //Funcionamiento de paquete
    
    public void crearPaquete(String cod_paq, String sv1, String sv2, String sv3, String sv4, String sv5, String sv6, String sv7, String sv8){
        ArrayList<Servicio> listaServicios = new ArrayList<Servicio>();
        List<Servicio> servicios = controlPersis.traerServicios();
        int coste = 0;
        
        for(Servicio servicio : servicios){
            //Compruebo la existencia del servicio
            if ((servicio.getNombre().equals(sv1)) ||
                (servicio.getNombre().equals(sv2)) ||
                (servicio.getNombre().equals(sv3)) ||
                (servicio.getNombre().equals(sv4)) ||
                (servicio.getNombre().equals(sv5)) ||
                (servicio.getNombre().equals(sv6)) ||
                (servicio.getNombre().equals(sv7)) ||
                (servicio.getNombre().equals(sv8))
                    ){
                //Sumo el valor individual de cada uno 
                //ya teniendo en cuenta el descuento por paquete
                listaServicios.add(servicio);
                coste =+ (int) ((servicio.getCosto_servicio())*0.9);
            }
        }
        
        Paquete paquete = new Paquete();
        paquete.setCodigo_paquete(cod_paq);
        paquete.setLista_servicios_incluidos(listaServicios);
        paquete.setCosto_paquete(coste);
        paquete.setEstado_paquete(true);
        controlPersis.crearPaquete(paquete);
    }
    
    public List<Paquete> traerPaquetes(){
        return controlPersis.traerPaquetes();
    }

    public Paquete buscarPaquete(int id) {
        return controlPersis.buscarPaquete(id);
    }
    
    public void modificarPaquete(int id, String nombre_paquete, String sv1, String sv2, String sv3, String sv4, String sv5, String sv6, String sv7, String sv8) throws Exception{
        ArrayList<Servicio> listaServicios = new ArrayList<Servicio>();
        List<Servicio> servicios = controlPersis.traerServicios();
        int coste = 0;
        
        for(Servicio servicio : servicios){
            //Compruebo la existencia del servicio
            if ((servicio.getNombre().equals(sv1)) ||
                (servicio.getNombre().equals(sv2)) ||
                (servicio.getNombre().equals(sv3)) ||
                (servicio.getNombre().equals(sv4)) ||
                (servicio.getNombre().equals(sv5)) ||
                (servicio.getNombre().equals(sv6)) ||
                (servicio.getNombre().equals(sv7)) ||
                (servicio.getNombre().equals(sv8))
                    ){
                //Sumo el valor individual de cada uno 
                //ya teniendo en cuenta el descuento por paquete
                listaServicios.add(servicio);
                coste =+ (int) ((servicio.getCosto_servicio())*0.9);
            }
        }
        
        Paquete paquete = controlPersis.buscarPaquete(id);
        paquete.setCodigo_paquete(nombre_paquete); //Nombre paquete es el codigo de paquete
        paquete.setLista_servicios_incluidos(listaServicios);
        paquete.setCosto_paquete(coste);
        
        controlPersis.modificarPaquete(paquete);

        
        
        
    }

    public void bajaPaquete(Paquete paquete) throws Exception {
        controlPersis.bajaPaquete(paquete);
    }


    ///Crea venta
    public void crearVenta(String vendedor, String cliente, String paquete, String s1, String s2, String s3){
        List<Cliente> listaClientes= controlPersis.traerClientes();
        List<Empleado> listaEmpleados = controlPersis.traerEmpleado();
        List<Servicio> listaServicios = controlPersis.traerServicios();
        List<Paquete> listaPaquetes = controlPersis.traerPaquetes();
        ArrayList<Servicio> servicios = new ArrayList<Servicio>();
        Cliente idCliente;      //Es la referencia al cliente
        Empleado idEmpleado;    //Es la referencia al empleado
        Paquete idPaquete;      //Es la referencia al paquete
        
        
        Venta venta = new Venta();
        
        //Busqueda de Ids y asignacion de atributos
        for(Cliente clienteB : listaClientes){
            if (clienteB.getEmail().equals(cliente))
                {idCliente = clienteB;
                venta.setCliente(idCliente);
                }
        }
        
        for(Empleado empleadoB : listaEmpleados){
            if (empleadoB.getEmail().equals(vendedor)){
                idEmpleado = empleadoB;
                venta.setEmpleado(idEmpleado);
            }         
        }
        
        for(Paquete paqueteB : listaPaquetes){
            if (paqueteB.getCodigo_paquete().equals(paquete)){
                idPaquete = paqueteB;
                venta.setPaquete(idPaquete);
            }
        }
        
        for(Servicio servicioB : listaServicios){
            if (servicioB.getNombre().equals(s1) ||
                servicioB.getNombre().equals(s2) ||
                servicioB.getNombre().equals(s3))
            
            {
                servicios.add(servicioB);
            
            }
        
        }
        
        if (servicios.size() > 0){
            venta.setServicios(servicios);
        }   

        venta.setMedio_pago("Efectivo");
        venta.setFecha_venta(new Date());
        controlPersis.crearVenta(venta);
    }
    
    public List<Venta> traerVentas(){
        return controlPersis.traerVentas();
    }

    public Venta buscarVenta(int id) {
        return controlPersis.buscarVenta(id);
    }

    public void modificarVenta(int id, String cliente, String empleado, String paquete, String servicio1, String servicio2, String servicio3) throws Exception {
        List<Cliente> listaClientes = controlPersis.traerClientes();
        List<Empleado> listaEmpleados = controlPersis.traerEmpleado();
        List<Paquete> listaPaquetes = controlPersis.traerPaquetes();
        List<Servicio> listaServicios = controlPersis.traerServicios();
        
        List<Servicio> servicios = new ArrayList<Servicio>();
        
        Venta venta = controlPersis.buscarVenta(id);
        
        for (Servicio listaServicio : listaServicios) {
            if (listaServicio.getNombre().equals(servicio1) ||
                listaServicio.getNombre().equals(servicio2) ||
                listaServicio.getNombre().equals(servicio3)) {
                servicios.add(listaServicio);
            }
        }
        
        for (Cliente listaCliente : listaClientes) {
            String auxNombre = (listaCliente.getNombre()+" "+listaCliente.getApellido());
            if (auxNombre.equals(cliente)){
            
                Cliente idCliente = listaCliente;
                venta.setCliente(idCliente);
            }
        }
        
        for (Empleado listaEmpleado : listaEmpleados) {
            if ((listaEmpleado.getNombre()+" "+listaEmpleado.getApellido()).equals(empleado)){
            
                Empleado idEmpleado = listaEmpleado;
                venta.setEmpleado(idEmpleado);
            }
        }
    
        for (Paquete listaPaquete : listaPaquetes) {
            if ((listaPaquete.getCodigo_paquete().equals(paquete))){
            
                Paquete idPaquete = listaPaquete;
                venta.setPaquete(idPaquete);
            }
        }
        
        venta.setServicios(servicios);
        
        controlPersis.modificarVenta(venta);
    }
    
    public void bajaVenta(int id) throws persistencia.exceptions.NonexistentEntityException{
        Venta venta = controlPersis.buscarVenta(id);
        
        controlPersis.bajaVenta(venta);
        
    }
}
