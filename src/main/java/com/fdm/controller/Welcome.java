package com.fdm.controller;

import java.io.IOException;
import java.security.Principal;
import java.sql.SQLException;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import com.fdm.model.Columns;
import com.fdm.model.ExtBook;
import com.fdm.model.dbstorage.BookDAO;
import com.fdm.model.dbstorage.UserDAO;
import com.fdm.model.service.BasketSessionController;
import com.fdm.model.service.ImageIO;
import com.fdm.model.service.JsonBuilderController;

@Controller
@Scope("session")
public class Welcome {

	private int count = 0;
	@Resource (name="imageIO")
	private ImageIO imageIO;

	@Resource(name="bookdao")
	private BookDAO bookDAO;

	@Resource(name="jsonbuildercontroller")
	private JsonBuilderController jsonbuilderController;

	@Resource(name="userdao")
	UserDAO userdao;

	@Resource(name="basketSessionController")
	private BasketSessionController basketSessionController;

	@RequestMapping(value="/home.html", method = RequestMethod.GET)
	public String home(HttpServletRequest req, Principal principal) throws SQLException{
		String username, role = null;
		String json = null;
		HttpSession session = req.getSession();
		if(req.getSession().getAttribute("count") != null){
			count = (Integer)session.getAttribute("count") ;			
		}

		/* int count is used as a flag to check if the assembler
		 * and getbookStock has been called.
		 * If they were called then count will be incremented 
		 * therefore it won't be called twice when you go to 
		 * the home page unless count was reset to zero
		 * again. This only happens when a new book is added.
		 */
		while(count == 0){
			int booksNumber = bookDAO.getBookStock();
			session.setAttribute("number",booksNumber);
			json = jsonbuilderController.assembler();
			count++;
			session.setAttribute("json", json);
		}
		session.setAttribute("count", count);
		try {
			username = principal.getName();
			role = userdao.getRole(username);
			session.setAttribute("usersession", username);
			session.setAttribute("userrole", role);
			basketSessionController.setBasketsession(session, username);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return "home";
	}

	@RequestMapping(value="/bookform.html", method = RequestMethod.GET)
	public String bookForm(ModelMap model, HttpServletRequest req) throws SQLException{
		List<String> authors = bookDAO.resultFactory(Columns.AUTHOR); //bookDAO.getAuthor();
		List<String> categories = bookDAO.resultFactory(Columns.CATEGORIES);//bookDAO.getCategory();
		List<String> publishers = bookDAO.resultFactory(Columns.PUBLISHER);//bookDAO.getPublisher();
		model.addAttribute("extBook", getBook());
		HttpSession session = req.getSession();
		session.setAttribute("author", authors);
		session.setAttribute("category", categories);
		session.setAttribute("publisher", publishers);
		return "bookform";
	}

	@RequestMapping(value="/bookformsubmission.html", method=RequestMethod.POST)
	public String addBook(@Valid ExtBook extBook, BindingResult result, HttpServletRequest req, @RequestParam("file") MultipartFile file) throws SQLException{
		String filename;
		if(file.isEmpty() || imageIO.isFileExtensionValid(file) == false){
			FieldError error = new FieldError("extBook", "imagepath",  "Please add a book image with any of the following extensions: .jpeg .jpg .png .gif .bmp");
			result.addError(error);
		}
		if(result.hasErrors()) {
			return "bookform";
		}else{
			try {
				filename = imageIO.bookImagewriter(file, extBook.getTitle());
			} catch (IOException e) {
			
				e.printStackTrace();
				return "bookform";
			}
			extBook.setImagepath("/uploads/Library/imgs/"+ filename);
			bookDAO.addBook(extBook);
			HttpSession session = req.getSession();
			session.setAttribute("count", count = 0);
			session.setAttribute("countTitleCopies", count = 0);
			session.removeAttribute("author");
			session.removeAttribute("category");
			session.removeAttribute("publisher");
			return "home";
		}
	}

	public ExtBook getBook() {
		return new ExtBook();
	}
}