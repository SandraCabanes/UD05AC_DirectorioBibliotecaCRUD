package ejemplo03.persistencia.dao.impl;

import ejemplo03.persistencia.dao.BibliotecaDAO;
import ejemplo03.dominio.Biblioteca;
import com.fpmislata.persistencia.dao.impl.GenericDAOImplHibernate;

public class BibliotecaDAOImplHibernate extends GenericDAOImplHibernate<Biblioteca,Integer> implements  BibliotecaDAO {

}
