package controller;

import entity.AuctionEntity;
import entity.CustomerEntity;
import java.sql.Date;
import java.time.LocalDate;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import static org.springframework.web.bind.annotation.RequestMethod.GET;
import org.springframework.web.bind.annotation.RequestParam;
import repository.AuctionRepository;
import repository.CustomerRepository;

@Controller
public class ManagerController {

    @Autowired
    CustomerRepository customerRepo;
    @Autowired
    AuctionRepository auctionRepo;

    //MANAGE
    //-----------------------------------------------------
    @RequestMapping(value = "/jsp/manage/homeManage", method = GET)
    public String homeManage(Model model) {
        return "/manage/index";
    }

    @RequestMapping(value = "/jsp/manage/manageAuction", method = GET)
    public String manageAuction(Model model) {
        LocalDate date = LocalDate.now();
        List<AuctionEntity> auctionList = (List<AuctionEntity>) auctionRepo.findAll();
        model.addAttribute("auctionList", auctionList);
        model.addAttribute("date",date);
        return "/manage/manageauction";
    }

    //manage report
    @RequestMapping(value = "/jsp/manage/manageReport", method = GET)
    public String manageReport(Model model) {
        List<AuctionEntity> auctionList = (List<AuctionEntity>) auctionRepo.findAll();
        model.addAttribute("auctionList", auctionList);
        return "/manage/manageReport";
    }

    @RequestMapping(value = "/jsp/manage/choseDateToReport", method = RequestMethod.POST)
    public String choseDateToReport(Model model, @RequestParam("fromdate") String fromdateString,
            @RequestParam("toDate") String toDateString
    ) {
        Date fromDate = Date.valueOf(fromdateString);
        Date toDate = Date.valueOf(toDateString);
        String mess = "";
        String sumamountString = "";
        List<AuctionEntity> auctionList = (List<AuctionEntity>) auctionRepo.findByStartDateBetween(fromDate, toDate);
        model.addAttribute("auctionList", auctionList);
        model.addAttribute("mess", mess);
        model.addAttribute("sumamountString", sumamountString);
        return "/manage/manageReport";
    }
    @RequestMapping(value = "/jsp/manage/choseDateMakeAuction", method = RequestMethod.POST)
    public String choseDateMakeAuction(Model model, @RequestParam("fromdate") String fromdateString,
            @RequestParam("toDate") String toDateString
    ) {
        Date fromDate = Date.valueOf(fromdateString);
        Date toDate = Date.valueOf(toDateString);
        String mess = "";
        String sumamountString = "";
        List<AuctionEntity> auctionList = (List<AuctionEntity>) auctionRepo.findByStartDateBetween(fromDate, toDate);
        model.addAttribute("auctionList", auctionList);
        model.addAttribute("mess", mess);
        model.addAttribute("sumamountString", sumamountString);
        return "/manage/manageauction";
    }

    @RequestMapping(value = "/jsp/manage/activeAuction", method = GET)
    public String activeAuction(Model model, @RequestParam("id") int auctionID) {
        AuctionEntity auction = auctionRepo.findOne(auctionID);
        auction.setStatus(1);
        auctionRepo.save(auction);
        List<AuctionEntity> auctionList = (List<AuctionEntity>) auctionRepo.findAll();
        model.addAttribute("auctionList", auctionList);
        return "/manage/manageauction";
    }

    @RequestMapping(value = "/jsp/manage/deactiveAuction", method = GET)
    public String deactiveAuction(Model model, @RequestParam("id") int auctionID) {
        AuctionEntity auction = auctionRepo.findOne(auctionID);
        auction.setStatus(0);
        auctionRepo.save(auction);
        List<AuctionEntity> auctionList = (List<AuctionEntity>) auctionRepo.findAll();
        model.addAttribute("auctionList", auctionList);
        return "/manage/manageauction";
    }

    @RequestMapping(value = "/jsp/manage/customerDetail", method = GET)
    public String viewDetail(Model model, @RequestParam("name") String name) {
        CustomerEntity customer = customerRepo.findByName(name);
        model.addAttribute("customer", customer);
        return "/manage/customerDetail";
    }

}
