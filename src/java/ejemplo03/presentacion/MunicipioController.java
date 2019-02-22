/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ejemplo03.presentacion;

import com.fpmislata.persistencia.dao.BussinessException;
import com.fpmislata.persistencia.dao.BussinessMessage;
import ejemplo03.dominio.Municipio;
import ejemplo03.persistencia.dao.MunicipioDAO;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Lorenzo González
 */
@Controller
public class MunicipioController {

    @Autowired
    private MunicipioDAO municipioDAO;
    
    @RequestMapping({"/index3.html"})
    public ModelAndView listarMunicipios(HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> model = new HashMap<String, Object>();
        String viewName;

        try {
                List<Municipio> municipios=municipioDAO.findAll();
            model.put("municipio",municipios);
            viewName = "municipioLista";
        } catch (BussinessException ex) {
            model.put("bussinessMessages", ex.getBussinessMessages());
            model.put("backURL", request.getContextPath() + "/index3.html");
            viewName = "error";
        }

        return new ModelAndView(viewName, model);
    }
    @RequestMapping({"/municipio/newForInsert"})
    public ModelAndView newForInsert(HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> model = new HashMap<String, Object>();
        String viewName;

        try {
            Municipio municipio = municipioDAO.create();
            model.put("formOperation", FormOperation.Insert);
            model.put("municipio", municipio);
            viewName = "municipio";
        } catch (BussinessException ex) {
            model.put("bussinessMessages", ex.getBussinessMessages());
            model.put("backURL", request.getContextPath() + "/index3.html");
            viewName = "error";
        }

        return new ModelAndView(viewName, model);
    }

    @RequestMapping({"/municipio/readForUpdate"})
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

            Municipio municipio = municipioDAO.get(id);
            if (municipio == null) {
                throw new BussinessException(new BussinessMessage(null, "No existe el municipio con id=" + id));
            }
            model.put("formOperation", FormOperation.Update);
            model.put("municipio", municipio);
            viewName = "municipio";
        } catch (BussinessException ex) {
            model.put("bussinessMessages", ex.getBussinessMessages());
            model.put("backURL", request.getContextPath() + "/index3.html");
            viewName = "error";
        }

        return new ModelAndView(viewName, model);
    }

    @RequestMapping({"/municipio/readForDelete"})
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

            Municipio municipio = municipioDAO.get(id);
            if (municipio == null) {
                throw new BussinessException(new BussinessMessage(null, "No existe el municipio con id=" + id));
            }
            model.put("formOperation", FormOperation.Delete);
            model.put("municipio", municipio);
            viewName = "municipio";
        } catch (BussinessException ex) {
            model.put("bussinessMessages", ex.getBussinessMessages());
            model.put("backURL", request.getContextPath() + "/index3.html");
            viewName = "error";
        }

        return new ModelAndView(viewName, model);
    }

    @RequestMapping({"/municipio/insert.html"})
    public ModelAndView insert(HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> model = new HashMap<String, Object>();
        String viewName;

        try {
            request.setCharacterEncoding("UTF-8");
        } catch (UnsupportedEncodingException ex) {
            throw new RuntimeException(ex);
        }

        Municipio municipio = null;
        try {
            municipio = municipioDAO.create();

            municipio.setCodMunicipio(Integer.parseInt(request.getParameter("codMunicipio")));
               
            

            municipioDAO.saveOrUpdate(municipio);

            viewName = "redirect:/index3.html";
        } catch (BussinessException ex) {
            model.put("bussinessMessages", ex.getBussinessMessages());
            if (municipio!=null) {
                municipio.setIdMunicipio(0);
            }
            model.put("municipio", municipio);
            model.put("formOperation", FormOperation.Insert);
            viewName = "municipio";
        }



        return new ModelAndView(viewName, model);
    }

    @RequestMapping({"/municipio/update.html"})
    public ModelAndView update(HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> model = new HashMap<String, Object>();
        String viewName;
        try {
            request.setCharacterEncoding("UTF-8");
        } catch (UnsupportedEncodingException ex) {
            throw new RuntimeException(ex);
        }
        Municipio municipio = null;
        try {
            int id;
            try {
                id = Integer.parseInt(request.getParameter("id"));
            } catch (NumberFormatException nfe) {
                throw new BussinessException(new BussinessMessage(null,"Se debe escribir un Id válido"));
            }
            municipio = municipioDAO.get(id);
            if (municipio == null) {
                throw new BussinessException(new BussinessMessage(null, "Ya no existe el municipio."));
            }
            municipio.setCodMunicipio(Integer.parseInt(request.getParameter("codMunicipio")));
             

            municipioDAO.saveOrUpdate(municipio);

            viewName = "redirect:/index3.html";
        } catch (BussinessException ex) {
            model.put("bussinessMessages", ex.getBussinessMessages());
            model.put("municipio", municipio);
            model.put("formOperation", FormOperation.Update);
            viewName = "municipio";
        }

        return new ModelAndView(viewName, model);
    }

    @RequestMapping({"/municipio/delete.html"})
    public ModelAndView delete(HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> model = new HashMap<String, Object>();
        String viewName;

        Municipio municipio=null;
        try {
            int id;
            try {
                id = Integer.parseInt(request.getParameter("id"));
            } catch (NumberFormatException nfe) {
                throw new BussinessException(new BussinessMessage(null,"Se debe escribir un Id válido"));
            }
            municipio = municipioDAO.get(id);
            if (municipio == null) {
                throw new BussinessException(new BussinessMessage(null, "Ya no existe el municipio a borrar"));
            }

            municipioDAO.delete(id);

            viewName = "redirect:/index3.html";
        } catch (BussinessException ex) {
            model.put("bussinessMessages", ex.getBussinessMessages());
            model.put("municipio", municipio);
            model.put("formOperation", FormOperation.Delete);
            viewName = "municipio";
        }

        return new ModelAndView(viewName, model);
    }

}
