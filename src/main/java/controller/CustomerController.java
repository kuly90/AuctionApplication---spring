package controller;


import entity.AuctionEntity;
import entity.BidsEntity;
import entity.BuildBroadEntity;
import entity.ComissionEntity;
import entity.CreditCardEntity;
import entity.CustomerEntity;
import entity.GoodsEntity;
import entity.ImageGoodEntity;
import entity.RoleEntity;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import static org.springframework.web.bind.annotation.RequestMethod.GET;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import repository.AuctionRepository;
import repository.BidsRepository;
import repository.BuildBroadRepository;
import repository.ComissionRepository;
import repository.CreditCardRepository;
import repository.CustomerRepository;
import repository.GoodsRepository;
import repository.ImageGoodRepository;
import repository.RoleRepository;
import repository.TransactionsRepository;

@Controller
@RequestMapping("/")
public class CustomerController {

    ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("beans.xml");

    @Autowired
    CreditCardRepository cardRepository;
    @Autowired
    ComissionRepository comissionRepo;
    @Autowired
    GoodsRepository goodsRepository;
    @Autowired
    ImageGoodRepository imageGoodRepo;
    @Autowired
    CustomerRepository customerRepo;
    @Autowired
    AuctionRepository auctionRepo;
    @Autowired
    BidsRepository bidsRepository;
    @Autowired
    BuildBroadRepository broadRepository;
    @Autowired
    RoleRepository roleRepository;
    @Autowired
    TransactionsRepository tranrepo;
    static String pathName = "D:\\java cap toc\\Project2\\AuctionApplication\\src\\main\\webapp\\resources\\images\\goods\\";

    //index default
    @RequestMapping(method = GET)
    public String loadAuction(Model model) {
        List<AuctionEntity> auctionListNotFinish = (List<AuctionEntity>) auctionRepo.findByStatus(1);
       
        //dem so trang auction Not Finish
        int totalNotFinish = auctionListNotFinish.size();
        int firstResult, maxResult, pages = 1;

        int totalPages;
        if (totalNotFinish % 12 == 0) {
            totalPages = totalNotFinish / 12;
        } else {
            totalPages = (totalNotFinish / 12) + 1;
        }
        int count = 0;
        if (totalNotFinish <= 12) {
            firstResult = 0;
            maxResult = totalNotFinish;
        } else {
            firstResult = (pages - 1) * 12;
            maxResult = firstResult + 12;
        }

        List<AuctionEntity> auList = new ArrayList<>();
        for (int i = firstResult; i < totalNotFinish && i < maxResult; i++) {
            count++;
            auList.add(auctionListNotFinish.get(i));
        }
        
        //count = count + firstResult;
        model.addAttribute("auctionListNotFinishSize", count);
        model.addAttribute("pages", pages);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("auctionListNotFinish", auList);
        
        return "index";
    }

    //index
    @RequestMapping(value = "index", method = GET)
    public String loadAuctionIndex(@RequestParam("pages") int pages, Model model) {
        List<AuctionEntity> auctionListNotFinish = (List<AuctionEntity>) auctionRepo.findByStatus(1);
        //dem so trang auction Not Finish
        int totalNotFinish = auctionListNotFinish.size();
        int firstResult, maxResult;

        int totalPages;
        if (totalNotFinish % 12 == 0) {
            totalPages = totalNotFinish / 12;
        } else {
            totalPages = (totalNotFinish / 12) + 1;
        }
        int count = 0;
        if (totalNotFinish <= 12) {
            firstResult = 0;
            maxResult = totalNotFinish;
        } else {
            firstResult = (pages - 1) * 12;
            maxResult = firstResult + 12;
        }

        List<AuctionEntity> auList = new ArrayList<>();
        for (int i = firstResult; i < totalNotFinish && i < maxResult; i++) {
            count++;
            auList.add(auctionListNotFinish.get(i));
        }

        //count = count + firstResult;
        model.addAttribute("auctionListNotFinishSize", count);
        model.addAttribute("pages", pages);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("auctionListNotFinish", auList);
        return "index";
    }

    //index customer
    @RequestMapping(value = "jsp/customer/resultPage", method = GET)
    public String loadIndexCustomer(@RequestParam("pages") int pages, Model model) {
        List<AuctionEntity> auctionListNotFinish = (List<AuctionEntity>) auctionRepo.findByStatus(1);
        //dem so trang auction Not Finish
        int totalNotFinish = auctionListNotFinish.size();
        int firstResult, maxResult;

        int totalPages;
        if (totalNotFinish % 12 == 0) {
            totalPages = totalNotFinish / 12;
        } else {
            totalPages = (totalNotFinish / 12) + 1;
        }
        int count = 0;
        if (totalNotFinish <= 12) {
            firstResult = 0;
            maxResult = totalNotFinish;
        } else {
            firstResult = (pages - 1) * 12;
            maxResult = firstResult + 12;
        }

        List<AuctionEntity> auList = new ArrayList<>();
        for (int i = firstResult; i < totalNotFinish && i < maxResult; i++) {
            count++;
            auList.add(auctionListNotFinish.get(i));
        }

        model.addAttribute("auctionListNotFinishSize", count);
        model.addAttribute("pages", pages);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("auctionListNotFinish", auList);

        return "/customer/index";
    }

    //search
    @RequestMapping(value = "/search", method = RequestMethod.POST)
    public String search(@RequestParam("searchName") String searchName, @RequestParam("pages") int pages, Model model) {

        List<AuctionEntity> auctionListNotFinish;

        if (searchName.isEmpty()) {
            auctionListNotFinish = (List<AuctionEntity>) auctionRepo.findByStatus(1);
        } else {
            auctionListNotFinish = (List<AuctionEntity>) auctionRepo.listSearchNotPrice(searchName, 1);
        }

        int totalNotFinish = auctionListNotFinish.size();
        int firstResult, maxResult;

        int totalPages;
        if (totalNotFinish % 12 == 0) {
            totalPages = totalNotFinish / 12;
        } else {
            totalPages = (totalNotFinish / 12) + 1;
        }
        int count = 0;
        if (totalNotFinish <= 12) {
            firstResult = 0;
            maxResult = totalNotFinish;
        } else {
            firstResult = (pages - 1) * 12;
            maxResult = firstResult + 12;
        }

        List<AuctionEntity> auList = new ArrayList<>();
        for (int i = firstResult; i < totalNotFinish && i < maxResult; i++) {
            count++;
            auList.add(auctionListNotFinish.get(i));
        }

        //count = count + firstResult;
        model.addAttribute("auctionListNotFinishSize", count);
        model.addAttribute("pages", pages);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("auctionListNotFinish", auList);
        return "index";
    }

    //search index customer
    @RequestMapping(value = "/jsp/customer/search", method = RequestMethod.POST)
    public String searchCustomer(@RequestParam("searchName") String searchName, @RequestParam("pages") int pages, Model model) {

        List<AuctionEntity> auctionListNotFinish;

        if (searchName.isEmpty()) {
            auctionListNotFinish = (List<AuctionEntity>) auctionRepo.findByStatus(1);
        } else {
            auctionListNotFinish = (List<AuctionEntity>) auctionRepo.listSearchNotPrice(searchName, 1);
        }

        int totalNotFinish = auctionListNotFinish.size();
        int firstResult, maxResult;

        int totalPages;
        if (totalNotFinish % 12 == 0) {
            totalPages = totalNotFinish / 12;
        } else {
            totalPages = (totalNotFinish / 12) + 1;
        }
        int count = 0;
        if (totalNotFinish <= 12) {
            firstResult = 0;
            maxResult = totalNotFinish;
        } else {
            firstResult = (pages - 1) * 12;
            maxResult = firstResult + 12;
        }

        List<AuctionEntity> auList = new ArrayList<>();
        for (int i = firstResult; i < totalNotFinish && i < maxResult; i++) {
            count++;
            auList.add(auctionListNotFinish.get(i));
        }

        //count = count + firstResult;
        model.addAttribute("auctionListNotFinishSize", count);
        model.addAttribute("pages", pages);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("auctionListNotFinish", auList);
        return "/customer/index";
    }

    //init
    @RequestMapping(value = "/jsp/customer/init", method = GET)
    public String initAuction(Model model) {
        List<ComissionEntity> comList = (List<ComissionEntity>) comissionRepo.findAll();
        model.addAttribute("comList", comList);
        return "/customer/initauction";
    }

    //intit accept
    @RequestMapping(value = "jsp/customer/initAuctionAccept", method = RequestMethod.POST)
    public String initAuctionAccepts(
            @RequestParam("reservePrice") double reservePrice,
            @RequestParam("startDate") String startDate,
            @RequestParam("hourStart") int hourStart,
            @RequestParam("minutesStart") int minutesStart,
            @RequestParam("duration") int duration,
            @RequestParam("goodName") String nameGood,
            @RequestParam("startPrices") double startPrice,
            @RequestParam("description") String description,
            @RequestParam("image") MultipartFile[] file,
            Model model) {
        ArrayList nameImage = new ArrayList();
        if (file != null && file.length > 0) {
            for (int i = 0; i < file.length; i++) {
                try {
                    String fileName = file[i].getOriginalFilename();
                    if (fileName != "") {
                        nameImage.add(fileName);
                    }
                    byte[] bytes = file[i].getBytes();
                    BufferedOutputStream buffStream
                            = new BufferedOutputStream(new FileOutputStream(new File(pathName + fileName)));
                    buffStream.write(bytes);
                    buffStream.close();
                } catch (Exception e) {
                    System.out.println(e);
                }
            }

        }
        //get infor to insert goods
        GoodsEntity goods = new GoodsEntity();
        goods.setGoodName(nameGood);
        goods.setStatus(true);
        goods.setDescription(description);
        //insert goods
        goodsRepository.save(goods);
        GoodsEntity gFindId = goodsRepository.findByGoodNameAndDescriptionAndStatus(nameGood, description, true);
        if (gFindId != null) {
            //insert to imageGood
            gFindId.getGoodID();
            for (int i = 0; i < nameImage.size(); i++) {
                if (nameImage.get(i) != "") {
                    ImageGoodEntity imageG = new ImageGoodEntity();
                    imageG.setImageUrl(nameImage.get(i).toString());
                    imageG.setGoodsEntity(goods);
                    imageGoodRepo.save(imageG);
                }
            }
        }
        //select comission
        ComissionEntity com = comissionRepo.findByMinimumLessThanAndMaximumGreaterThanAndStatus(startPrice, startPrice, true);
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String userName = auth.getName(); //get logged in username
        CustomerEntity c = customerRepo.findByUserName(userName);
        //insert to auction
        AuctionEntity auction = new AuctionEntity();
        //set data
        auction.setCustomerEntity(c);
        auction.setGoodsEntity(goods);
        auction.setComissionEntity(com);
        auction.setMinimunPrice(startPrice);
        auction.setReserverPrice(reservePrice);
        auction.setStartDate(Date.valueOf(startDate));
        auction.setHourStart(hourStart);
        auction.setMinuteStart(minutesStart);
        Calendar date = Calendar.getInstance();
        int second = date.get(Calendar.SECOND);
        auction.setSecondStart(second);
        //auction.setSecondStart(secondStart);
        auction.setDuration(duration);
        auction.setDateChange(null);
        auction.setStatus(0);
        auctionRepo.save(auction);
        List<ComissionEntity> comList = (List<ComissionEntity>) comissionRepo.findAll();
        model.addAttribute("comList", comList);
        return "/customer/initauction";
    }

    @RequestMapping(value = "/jsp/customer/debit", method = GET)
    public String debitCard(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String userName = auth.getName(); //get logged in username
        CustomerEntity c = customerRepo.findByUserName(userName);
        CreditCardEntity cardEntity = cardRepository.findByCustomerID(c.getCustomerID());
        model.addAttribute("cardEntity", cardEntity);
        return "/customer/debitmoney";
    }

    @RequestMapping(value = "/jsp/customer/debitRequest")
    public String debitMoneyAccept(@RequestParam("numberAccount") String numberAccount,
            @RequestParam("amount") double amount,
            Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String userName = auth.getName(); //get logged in username
        CustomerEntity c = customerRepo.findByUserName(userName);
        CreditCardEntity cardEntity = cardRepository.findByCustomerID(c.getCustomerID());
        CreditCardEntity c1 = cardRepository.findByNumberAccount(numberAccount);
        if (c1 != null) {
            if (amount <= 500) {
                c1.setAmount(c1.getAmount() + amount);
                cardRepository.save(c1);
                model.addAttribute("msg1", "Deposit Success.");
                model.addAttribute("cardEntity", cardEntity);
            } else {
                model.addAttribute("msg2", " Amount must be less 500$");
                model.addAttribute("cardEntity", cardEntity);
            }

        } else {
            model.addAttribute("msg3", "Invaild CardNumber. Please Try Again.");
        }
        return "/customer/debitmoney";

    }
    //call register.jsp

    @RequestMapping(value = "/register", method = GET)
    public String register(Model model
    ) {
        return "register";
    }

    //register account
    @RequestMapping(value = "/registerAccount", method = RequestMethod.POST)
    public String insertCustomer(@RequestParam("userName") String userName,
            @RequestParam("password") String password,
            @RequestParam("passwordconfirm") String passwordconfirm,
            @RequestParam("name") String name,
            @RequestParam("email") String email,
            @RequestParam("address") String address,
            @RequestParam("phone") String phone,
            @RequestParam("numberAccount") String numberAccount,
            @RequestParam("dateOpen") String dateOpen,
            @RequestParam("validTo") String validTo, Model model
    ) {
        CustomerEntity customer = customerRepo.findByUserName(userName);
        RoleEntity role = roleRepository.findByRoleID(3);
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

                        Date dateOpenFormat = Date.valueOf(dateOpen);
                        Date validToFormat = Date.valueOf(validTo);
                        customer = customerRepo.findByUserNameAndPasswordAndNameAndEmailAndAddressAndPhone(userName, password, name, email, address, phone);
                        if (customer != null) {
                            CreditCardEntity cardEntity = cardRepository.findByNumberAccount(numberAccount);
                            if (cardEntity != null) {
                                customerRepo.delete(customer);
                                model.addAttribute("msg3", "Card number is already registered, please enter the other card!!!");
                            } else {
                                cardEntity = new CreditCardEntity();
                                cardEntity.setNumberAccount(numberAccount);
                                cardEntity.setDateOpen(dateOpenFormat);
                                cardEntity.setValidTo(validToFormat);
                                cardEntity.setCustomerID(customer.getCustomerID());
                                CreditCardEntity insertCreditCard = cardRepository.save(cardEntity);
                                if (insertCreditCard != null) {
                                    String message = "Account registration successful!!!";
                                    model.addAttribute("msg4", message);
                                } else {
                                    customerRepo.delete(customer);
                                    String message = "Account registration failed!!!";
                                    model.addAttribute("msg5", message);
                                }
                            }
                        }
                    } else {
                        model.addAttribute("msg6", "Account registration failed!!!");
                    }
                } else {
                    String message = "Confirm password do not match!!!";
                    model.addAttribute("msg7", message);
                }

            }
        }
        return "register";
    }

    //edit customer
    @RequestMapping(value = "/jsp/customer/editAccount", method = GET)
    public String editAccount(Model model
    ) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String userName = auth.getName(); //get logged in username
        CustomerEntity customer = customerRepo.findByUserName(userName);
        model.addAttribute("customer", customer);
        return "/customer/edit";
    }

    //update customer
    @RequestMapping(value = "/jsp/customer/updateAccount", method = RequestMethod.POST)
    public String updateAccount(@RequestParam("customerID") int customerID,
            @RequestParam("userName") String userName,
            @RequestParam("name") String name,
            @RequestParam("email") String email,
            @RequestParam("address") String address,
            @RequestParam("phone") String phone, Model model
    ) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String userName1 = auth.getName(); //get logged in username
        RoleEntity role = roleRepository.findByRoleID(3);
        CustomerEntity customer = customerRepo.findByUserName(userName1);
        customer.setCustomerID(customerID);
        customer.setName(name);
        customer.setAddress(address);
        customer.setEmail(email);
        customer.setUserName(userName);
        customer.setPhone(phone);
        customer.setRoleEntity(role);
        customer.setStatus(true);
        CustomerEntity insertCustomer = customerRepo.save(customer);
        if (insertCustomer != null) {
            CustomerEntity customer1 = customerRepo.findOne(customerID);
            String message = "Update successful!!!";
            model.addAttribute("msg", message);
            model.addAttribute("customer",customer1);
        } else {
            model.addAttribute("msg", "Update failed!!!");
        }
        
        return "/customer/edit";
    }

    //call view card
    @RequestMapping(value = "/jsp/customer/viewCard", method = GET)
    public String viewCard(Model model
    ) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String userName = auth.getName(); //get logged in username
        CustomerEntity customer = customerRepo.findByUserName(userName);
        CreditCardEntity cardEntity = cardRepository.findByCustomerID(customer.getCustomerID());
        model.addAttribute("cardEntity", cardEntity);
        return "/customer/viewcard";
    }

    //call changepass
    @RequestMapping(value = "/jsp/customer/changePass", method = GET)
    public String viewChangePass(Model model
    ) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String userName = auth.getName(); //get logged in username
        CustomerEntity customer = customerRepo.findByUserName(userName);
        model.addAttribute("customer", customer);
        return "/customer/changepass";
    }

    //update password
    @RequestMapping(value = "/jsp/customer/updatePass", method = RequestMethod.POST)
    public String updatePass(@RequestParam("passwordold") String passwordold,
            @RequestParam("passwordnew") String passwordnew,
            @RequestParam("passwordconfirm") String passwordconfirm,
            @RequestParam("passwordcheck") String passwordcheck, Model model
    ) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String userName = auth.getName(); //get logged in username

        CustomerEntity customer = customerRepo.findByUserName(userName);

        if (passwordcheck.equals(passwordold)) {
            if (passwordnew.equals(passwordconfirm)) {
                customer.setPassword(passwordnew);
                CustomerEntity insertCustomer = customerRepo.save(customer);
                if (insertCustomer != null) {
                    String message = "Update successful!!!";
                    model.addAttribute("msg1", message);
                } else {
                    model.addAttribute("msg2", "Update failed!!!");
                }

            } else {
                String message = "Confirm Password Do Not Match!!!";
                model.addAttribute("msg3", message);
            }

        } else {
            String message = "Enter Password Old Again!!!";
            model.addAttribute("msg4", message);
        }

        return "/customer/changepass";
    }

    //view auction
    @RequestMapping(value = "/jsp/customer/viewAuction", method = GET)
    public String viewAuction(@RequestParam("id") int id, Model model
    ) {
        AuctionEntity auctionEntity = auctionRepo.findOne(id);
        List<BidsEntity> bidsList = (List<BidsEntity>) bidsRepository.findByAuctionEntity(auctionEntity);
        int sumBid = bidsList.size();
        List<BuildBroadEntity> broadList = (List<BuildBroadEntity>) broadRepository.findByAuctionEntity(auctionEntity);
        model.addAttribute("auctionEntity", auctionEntity);
        model.addAttribute("sumBid", sumBid);
        model.addAttribute("bidsList", bidsList);
        model.addAttribute("broadList", broadList);
        return "/customer/viewauction";
    }

    // make a bid
    @RequestMapping(value = "/jsp/customer/makeaBids", method = RequestMethod.POST)
    public String makeABids(@RequestParam("idAuction") int idAuction,
            @RequestParam("bidMoney") double bidMoney,
            Model model
    ) {
        //get logged in username
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String userName = auth.getName();
        CustomerEntity customer = customerRepo.findByUserName(userName);
        int customerID = customer.getCustomerID();
        //kt seller not bid
        AuctionEntity auc = auctionRepo.findByAuctionID(idAuction);
        if (auc != null) {
            if (customerID == auc.getCustomerEntity().getCustomerID()) {
                model.addAttribute("msg", "you can not bid on auction to create");
            } else {
                //kt so amount da bid tren cac auction chua finish
                double amountBid;
                String amountBidString = bidsRepository.sumAmountByCustomerOfBid(1, customerID);
                if (amountBidString == null) {
                    amountBid = 0.0;
                } else {
                    amountBid = Double.parseDouble(amountBidString);
                }

                //kt so amount co trong card
                CreditCardEntity cardEntity = cardRepository.findByCustomerID(customerID);
                double amountCard = cardEntity.getAmount();
                //make a bid
                //check amount card
                if (amountCard - amountBid - bidMoney >= 0) {
                    //check customer last bid
                    String customerLastBidString = bidsRepository.findCustomerIDLastBid(idAuction);
                    if (customerLastBidString == null) {
                        BidsEntity bids = new BidsEntity();
                        bids.setAuctionEntity(auctionRepo.findOne(idAuction));
                        bids.setAmount(bidMoney);
                        bids.setCustomerEntity(customerRepo.findOne(customerID));
                        bids.setDate(new java.util.Date());
                        bidsRepository.save(bids);
                    } else {
                        int customerLastBid = Integer.parseInt(customerLastBidString);
                        if (customerLastBid != customerID) {
                            BidsEntity bids = new BidsEntity();
                            bids.setAuctionEntity(auctionRepo.findOne(idAuction));
                            bids.setAmount(bidMoney);
                            bids.setCustomerEntity(customerRepo.findOne(customerID));
                            bids.setDate(new java.util.Date());
                            bidsRepository.save(bids);
                        } else {
                            model.addAttribute("msg", "you are putting to the highest bidder");
                        }
                    }
                } else {
                    model.addAttribute("msg", "Not enough money. Please deposit money");
                }
            }
        }
        AuctionEntity auctionEntity = auctionRepo.findOne(idAuction);
        List<BidsEntity> bidsList = (List<BidsEntity>) bidsRepository.findByAuctionEntity(auctionEntity);
        List<BuildBroadEntity> broadList = (List<BuildBroadEntity>) broadRepository.findByAuctionEntity(auctionEntity);
        model.addAttribute("auctionEntity", auctionEntity);
        model.addAttribute("bidsList", bidsList);
        model.addAttribute("broadList", broadList);
        return "/customer/viewauction";
    }

    @RequestMapping(value = "/jsp/customer/postAMessage", method = RequestMethod.POST)
    public String postaMessage(@RequestParam("idAuction") int idAuction,
            @RequestParam("message") String message,
            Model model
    ) {
        //find customer
        //get logged in username
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String userName = auth.getName();
        CustomerEntity customer = customerRepo.findByUserName(userName);
        int customerID = customer.getCustomerID();

        BuildBroadEntity broad = new BuildBroadEntity();
        broad.setAuctionEntity(auctionRepo.findOne(idAuction));
        broad.setCustomerEntity(customerRepo.findOne(customerID));
        broad.setMessage(message);
        broad.setDate(new java.util.Date());
        broadRepository.save(broad);
        //return view auction
        AuctionEntity auctionEntity = auctionRepo.findOne(idAuction);
        List<BidsEntity> bidsList = (List<BidsEntity>) bidsRepository.findByAuctionEntity(auctionEntity);
        List<BuildBroadEntity> broadList = (List<BuildBroadEntity>) broadRepository.findByAuctionEntity(auctionEntity);
        model.addAttribute("auctionEntity", auctionEntity);
        model.addAttribute("bidsList", bidsList);
        model.addAttribute("broadList", broadList);
        return "/customer/viewauction";
    }

    //list auction debit by customer
    @RequestMapping(value = "/jsp/customer/auction_bid", method = GET)
    public String viewAuctionDebit(Model model
    ) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String userName = auth.getName();
        CustomerEntity customer = customerRepo.findByUserName(userName);
        int customerID = customer.getCustomerID();
        List<String> listAuctionDebidByCustomer = (List<String>) auctionRepo.getListAuctionDebit(customerID);
        model.addAttribute("listAuctionDebid", listAuctionDebidByCustomer);
        return "/customer/auction_bid";
    }

    //list auction sell by customer
    @RequestMapping(value = "/jsp/customer/auction_sell", method = GET)
    public String viewAuctionSell(Model model
    ) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String userName = auth.getName();
        CustomerEntity customer = customerRepo.findByUserName(userName);

        List<AuctionEntity> listAuctionSellByCustomer = auctionRepo.findByCustomerEntity(customer);
        model.addAttribute("listAuctionSell", listAuctionSellByCustomer);
        return "/customer/auction_sell";
    }

    @RequestMapping(value = "/jsp/customer/cancelAuction", method = GET)
    public String cancelAuction(@RequestParam("id") int id,
            Model model
    ) {

        AuctionEntity auction = auctionRepo.findOne(id);

        if (auction.getStatus() == 0) {
            auctionRepo.delete(id);
            String message = "Cancel Auction Success!!";
            model.addAttribute("msg", message);

        }

        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String userName = auth.getName();
        CustomerEntity customer = customerRepo.findByUserName(userName);

        List<AuctionEntity> listAuctionSellByCustomer = auctionRepo.findByCustomerEntity(customer);
        model.addAttribute("listAuctionSell", listAuctionSellByCustomer);
        return "/customer/auction_sell";
    }

    @RequestMapping(value = "/jsp/customer/searchGoods", method = RequestMethod.POST)
    public String search(Model model, @RequestParam("search") String search) {
        List<AuctionEntity> auctionList = auctionRepo.listSearch(search);
        model.addAttribute("listAuctionSell", auctionList);
        return "/customer/auction_sell";
    }
    

}
