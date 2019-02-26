/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ejemplo03.presentacion;

import com.fpmislata.persistencia.dao.BussinessException;
import com.fpmislata.persistencia.dao.BussinessMessage;
import ejemplo03.dominio.Biblioteca;
import ejemplo03.persistencia.dao.BibliotecaDAO;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Lorenzo González
 */
@Controller
public class BibliotecaController {

    @Autowired
    private BibliotecaDAO bibliotecaDAO;
    
    @RequestMapping({"/bibliotecas.html"})
    public ModelAndView listarBibliotecas(HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> model = new HashMap<String, Object>();
        String viewName;

        try {
                List<Biblioteca> bibliotecas=bibliotecaDAO.findAll();
            model.put("bibliotecas",bibliotecas);
            viewName = "bibliotecaLista";
        } catch (BussinessException ex) {
            model.put("bussinessMessages", ex.getBussinessMessages());
            model.put("backURL", request.getContextPath() + "/bibliotecas.html");
            viewName = "error";
        }

        return new ModelAndView(viewName, model);
    }
    @RequestMapping({"/biblioteca/newForInsert"})
    public ModelAndView newForInsert(HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> model = new HashMap<String, Object>();
        String viewName;

        try {
            Biblioteca biblioteca = bibliotecaDAO.create();
            model.put("formOperation", FormOperation.Insert);
            model.put("biblioteca", biblioteca);
            viewName = "biblioteca";
        } catch (BussinessException ex) {
            model.put("bussinessMessages", ex.getBussinessMessages());
            model.put("backURL", request.getContextPath() + "/bibliotecas.html");
            viewName = "error";
        }

        return new ModelAndView(viewName, model);
    }

    @RequestMapping({"/biblioteca/readForUpdate"})
    public ModelAndView readForUpdate(HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> model = new HashMap<String, Object>();
        String viewName;

        try {
            int id;
            try {
                id = Integer.parseInt(request.getParameter("id"));
            } catch (NumberFormatException nfe) {
                throw new BussinessException(new BussinessMessage(null,"Se debe escribir un Id válido"));
            }

            Biblioteca biblioteca = bibliotecaDAO.get(id);
            if (biblioteca == null) {
                throw new BussinessException(new BussinessMessage(null, "No existe la biblioteca con id=" + id));
            }
            model.put("formOperation", FormOperation.Update);
            model.put("biblioteca", biblioteca);
            viewName = "biblioteca";
        } catch (BussinessException ex) {
            model.put("bussinessMessages", ex.getBussinessMessages());
            model.put("backURL", request.getContextPath() + "/bibliotecas.html");
            viewName = "error";
        }

        return new ModelAndView(viewName, model);
    }

    @RequestMapping({"/biblioteca/readForDelete"})
    public ModelAndView readForDelete(HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> model = new HashMap<String, Object>();
        String viewName;
        try {
            int id;
            try {
                id = Integer.parseInt(request.getParameter("id"));
            } catch (NumberFormatException nfe) {
                throw new BussinessException(new BussinessMessage(null,"Se debe escribir un Id válido"));
            }

            Biblioteca biblioteca = bibliotecaDAO.get(id);
            if (biblioteca == null) {
                throw new BussinessException(new BussinessMessage(null, "No existe la biblioteca con id=" + id));
            }
            model.put("formOperation", FormOperation.Delete);
            model.put("biblioteca", biblioteca);
            viewName = "biblioteca";
        } catch (BussinessException ex) {
            model.put("bussinessMessages", ex.getBussinessMessages());
            model.put("backURL", request.getContextPath() + "/bibliotecas.html");
            viewName = "error";
        }

        return new ModelAndView(viewName, model);
    }

    @RequestMapping({"/biblioteca/insert.html"})
    public ModelAndView insert(HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> model = new HashMap<String, Object>();
        String viewName;

        try {
            request.setCharacterEncoding("UTF-8");
        } catch (UnsupportedEncodingException ex) {
            throw new RuntimeException(ex);
        }

        Biblioteca biblioteca = null;
        try {
            biblioteca = bibliotecaDAO.create();

            biblioteca.setTipo(request.getParameter("tipo"));
            biblioteca.setNombre(request.getParameter("nombre"));
            biblioteca.setDireccion(request.getParameter("direccion"));
            biblioteca.setCodPostal(request.getParameter("codPostal"));
            biblioteca.setTelefono(request.getParameter("telefono"));
            biblioteca.setWeb(request.getParameter("web"));
            biblioteca.setEmail(request.getParameter("email"));
            biblioteca.setCatalogo(request.getParameter("catalogo"));
            

            bibliotecaDAO.saveOrUpdate(biblioteca);

            viewName = "redirect:/bibliotecas.html";
        } catch (BussinessException ex) {
            model.put("bussinessMessages", ex.getBussinessMessages());
            if (biblioteca!=null) {
                biblioteca.setIdBiblioteca(0);
            }
            model.put("biblioteca", biblioteca);
            model.put("formOperation", FormOperation.Insert);
            viewName = "biblioteca";
        }



        return new ModelAndView(viewName, model);
    }

    @RequestMapping({"/biblioteca/update.html"})
    public ModelAndView update(HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> model = new HashMap<String, Object>();
        String viewName;
        try {
            request.setCharacterEncoding("UTF-8");
        } catch (UnsupportedEncodingException ex) {
            throw new RuntimeException(ex);
        }
        Biblioteca biblioteca = null;
        try {
            int id;
            try {
                id = Integer.parseInt(request.getParameter("id"));
            } catch (NumberFormatException nfe) {
                throw new BussinessException(new BussinessMessage(null,"Se debe escribir un Id válido"));
            }
            biblioteca = bibliotecaDAO.get(id);
            if (biblioteca == null) {
                throw new BussinessException(new BussinessMessage(null, "Ya no existe la biblioteca."));
            }
            biblioteca.setTipo(request.getParameter("tipo"));
            biblioteca.setNombre(request.getParameter("nombre"));
            biblioteca.setDireccion(request.getParameter("direccion"));
            biblioteca.setCodPostal(request.getParameter("codPostal"));
            biblioteca.setTelefono(request.getParameter("telefono"));
            biblioteca.setWeb(request.getParameter("web"));
            biblioteca.setEmail(request.getParameter("email"));
            biblioteca.setCatalogo(request.getParameter("catalogo"));

            bibliotecaDAO.saveOrUpdate(biblioteca);

            viewName = "redirect:/bibliotecas.html";
        } catch (BussinessException ex) {
            model.put("bussinessMessages", ex.getBussinessMessages());
            model.put("biblioteca", biblioteca);
            model.put("formOperation", FormOperation.Update);
            viewName = "biblioteca";
        }

        return new ModelAndView(viewName, model);
    }

    @RequestMapping({"/biblioteca/delete.html"})
    public ModelAndView delete(HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> model = new HashMap<String, Object>();
        String viewName;

        Biblioteca biblioteca=null;
        try {
            int id;
            try {
                id = Integer.parseInt(request.getParameter("id"));
            } catch (NumberFormatException nfe) {
                throw new BussinessException(new BussinessMessage(null,"Se debe escribir un Id válido"));
            }
            biblioteca = bibliotecaDAO.get(id);
            if (biblioteca == null) {
                throw new BussinessException(new BussinessMessage(null, "Ya no existe la biblioteca a borrar"));
            }

            bibliotecaDAO.delete(id);

            viewName = "redirect:/bibliotecas.html";
        } catch (BussinessException ex) {
            model.put("bussinessMessages", ex.getBussinessMessages());
            model.put("biblioteca", biblioteca);
            model.put("formOperation", FormOperation.Delete);
            viewName = "biblioteca";
        }

        return new ModelAndView(viewName, model);
    }

}
