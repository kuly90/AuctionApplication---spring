package controller;

import entity.CustomerEntity;
import entity.RoleEntity;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import static org.springframework.web.bind.annotation.RequestMethod.GET;
import org.springframework.web.bind.annotation.RequestParam;
import repository.CustomerRepository;
import repository.RoleRepository;

@Controller
public class AdminController {

    @Autowired
    CustomerRepository customerRepo;

    @Autowired
    RoleRepository roleRepository;

    // ADMIN
    //----------------------------------------------------------------------------
    @RequestMapping(value = "/jsp/admin/homeAdmin", method = GET)
    public String homeAdmin(Model model) {
        return "/admin/index";
    }

    @RequestMapping(value = "/jsp/admin/deActiveUser", method = GET)
    public String deActiveUser(Model model, @RequestParam("id") int customerID) {
        CustomerEntity customerEntity = customerRepo.findOne(customerID);
        customerEntity.setStatus(false);
        customerRepo.save(customerEntity);
        List<CustomerEntity> cusList = (List<CustomerEntity>) customerRepo.findAll();
        model.addAttribute("cusList", cusList);
        return "/admin/listUser";
    }

    @RequestMapping(value = "/jsp/admin/ActiveUser", method = GET)
    public String activeUser(Model model, @RequestParam("id") int customerID) {
        CustomerEntity customerEntity = customerRepo.findOne(customerID);
        customerEntity.setStatus(true);
        customerRepo.save(customerEntity);
        List<CustomerEntity> cusList = (List<CustomerEntity>) customerRepo.findAll();
        model.addAttribute("cusList", cusList);
        return "/admin/listUser";
    }

    @RequestMapping(value = "/jsp/admin/listUser", method = GET)
    public String listUser(Model model) {

        List<CustomerEntity> cusList = (List<CustomerEntity>) customerRepo.findAll();
        model.addAttribute("cusList", cusList);
        return "/admin/listUser";
    }

    @RequestMapping(value = "/jsp/admin/listManage", method = GET)
    public String listManage(Model model) {

        List<CustomerEntity> cusList = (List<CustomerEntity>) customerRepo.findAll();
        model.addAttribute("cusList", cusList);
        return "/admin/listManage";
    }

    @RequestMapping(value = "/jsp/admin/deActiveManage", method = GET)
    public String deActiveManage(Model model, @RequestParam("id") int customerID) {
        CustomerEntity customerEntity = customerRepo.findOne(customerID);
        customerEntity.setStatus(false);
        customerRepo.save(customerEntity);
        List<CustomerEntity> cusList = (List<CustomerEntity>) customerRepo.findAll();
        model.addAttribute("cusList", cusList);
        return "/admin/listManage";
    }

    @RequestMapping(value = "/jsp/admin/ActiveManage", method = GET)
    public String activeManage(Model model, @RequestParam("id") int customerID) {
        CustomerEntity customerEntity = customerRepo.findOne(customerID);
        customerEntity.setStatus(true);
        customerRepo.save(customerEntity);
        List<CustomerEntity> cusList = (List<CustomerEntity>) customerRepo.findAll();
        model.addAttribute("cusList", cusList);
        return "/admin/listManage";
    }

    @RequestMapping(value = "/jsp/admin/addManage", method = GET)
    public String addManage(Model model) {
        return "/admin/addManage";
    }

    @RequestMapping(value = "/jsp/admin/addNewManage", method = RequestMethod.POST)
    public String insertManage(@RequestParam("userName") String userName, @RequestParam("password") String password,
            @RequestParam("passwordconfirm") String passwordconfirm,
            @RequestParam("name") String name, @RequestParam("email") String email, @RequestParam("address") String address,
            @RequestParam("phone") String phone, Model model) {
        CustomerEntity customer = customerRepo.findByUserName(userName);
        RoleEntity role = roleRepository.findByRoleID(1);
        if (customer != null) {
            model.addAttribute("msg1", "This account has already existed!!!");
        } else {
            customer = customerRepo.findByEmail(email);
            if (customer != null) {
                model.addAttribute("msg2", "Email has been registered!!!");
            } else {

                customer = new CustomerEntity();
                customer.setName(name);
                customer.setPhone(phone);
                customer.setAddress(address);
                customer.setEmail(email);
                customer.setUserName(userName);
                customer.setPassword(password);
                customer.setRoleEntity(role);

                customer.setStatus(true);
                if (password.equals(passwordconfirm)) {
                    CustomerEntity insertCustomer = customerRepo.save(customer);
                    if (insertCustomer != null) {
                        String message = "Add Manage successful";
                        model.addAttribute("msg4", message);
                    } else {
                        model.addAttribute("msg5", "Add Manage failed!!!");
                    }
                } else {
                    String message = "password confirm do not match";
                    model.addAttribute("msg3", message);
                }

            }
        }
        return "/admin/addManage";
    }

    @RequestMapping(value = "/jsp/admin/searchCustomer", method = RequestMethod.POST)
    public String search(Model model, @RequestParam("search") String search) {
        List<CustomerEntity> cusList = customerRepo.listSearch(search);
        model.addAttribute("cusList", cusList);
        return "/admin/listUser";
    }
    
    @RequestMapping(value = "/jsp/admin/searchManage", method = RequestMethod.POST)
    public String search2(Model model, @RequestParam("search") String search) {
        List<CustomerEntity> cusList = customerRepo.listSearch2(search);
        model.addAttribute("cusList", cusList);
        return "/admin/listManage";
    }

}
