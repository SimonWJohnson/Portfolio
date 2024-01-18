/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dispatchers;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import utility.AdmitBookStoreDAO;

/**
 *
 * @author dalevanh
 */
public class TitlesDispatcher  implements IDispatcher{

    public String execute(HttpServletRequest request) {
        AdmitBookStoreDAO dao = new AdmitBookStoreDAO();
        List books = null;
        String nextPage = "/jsp/error.jsp";
        HttpSession session = request.getSession();
        try{
            //System.out.println("inside try block of ShowHomeAO.exe()");
            books = dao.getAllBooks();
            session.setAttribute ("books", books);
            nextPage = "/jsp/titles.jsp";
            
        }catch(Exception ex) {
            request.setAttribute ("result",ex.getMessage ());
            nextPage= "/jsp/error.jsp";
        } // end catch
        finally{
            return nextPage;
        }
    }
    
}
