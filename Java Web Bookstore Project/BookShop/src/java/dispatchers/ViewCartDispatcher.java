/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dispatchers;

import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import utility.AdmitBookStoreDAO;

/**
 *
 * @author dalevanh
 */
public class ViewCartDispatcher implements IDispatcher{

    public String execute(HttpServletRequest request) {
        AdmitBookStoreDAO dao = new AdmitBookStoreDAO();
        String nextPage = "/jsp/titles.jsp";
        HttpSession session = request.getSession();
        nextPage = "/jsp/cart.jsp";
        Map cart = (Map) session.getAttribute("cart");
        
        if (cart == null) {
            nextPage = "/jsp/titles.jsp";
        }
        else {
            nextPage = "/jsp/cart.jsp";
        }
        return nextPage;
    }
    
}
