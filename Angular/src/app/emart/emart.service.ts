import { Injectable } from '@angular/core';
import { Category } from './category';
import { SubCategory } from './sub-category';
import { Item } from './item';
import { Bill } from './bill';
import { Seller } from './seller';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Buyer } from './buyer';

@Injectable({
  providedIn: 'root'
})
export class EmartService {
  

  categories: Category[];
  subCategories: SubCategory[];
  allItems: Item[];
  cartItems: any[];
  allBills: any;
  allSellers: Seller[];
  currentBuyer: any;
  allBuyers: Buyer[];
  currentSeller:any;

  constructor(protected http: HttpClient) {
    this.cartItems = [];
    this.allBills = [];

  }

  //Accessing end point for retrieving all items.
  getAllItems() {
    return this.http.get("http://localhost:8083/buyer-item-service/emart/item/all");
  }

  getCategories(): Category[] {
    return [].concat(this.categories);
  }

  getSubCategories(): SubCategory[] {
    return [].concat(this.subCategories);
  }
  setAllBills(billsList: any) {
    this.allBills = billsList;
  }
  getAllBills(): Bill[] {
    return this.allBills;
  }
  //Accessing end point for retrieving an item.
  getItem(id: string): any {

    return this.http.get("http://localhost:8083/buyer-item-service/emart/item/" + id);

  }

  addToCart(itemObj: any) {

    this.cartItems.push(itemObj);
  }

  getAllCart() {
    return [].concat(this.cartItems);
  }

  setAllCart(cartItems: any) {
    this.cartItems = cartItems;
  }

  deleteCartItem(itemNo: number) {
    let size = this.cartItems.length;
    for (let i = 0; i < size; i++) {
      if (this.cartItems[i].id == itemNo) {
        this.cartItems.splice(i, 1);
        break;
      }
    }
    return [].concat(this.cartItems);
  }

  //Accessing end point for adding the bill. 
  addBill(todayDate: Date, total: number) {

    let allBillDetails: any[] = [];
    for (let i = 0; i < this.cartItems.length; i++) {
      allBillDetails.push(
        {
          billDetailsId: 0,
          bill: null,
          item: this.cartItems[i]

        }
      );
    }


    let bill: any = {
      id: 0,
      type: 'credit',
      date: todayDate,
      remarks: '',
      amount: total,
      buyer: {
        id: this.currentBuyer.id
      },
      allBillDetails: allBillDetails
    }
    //this.allBills.push(bill);


    this.cartItems = [];
    allBillDetails = [];
    return this.http.post("http://localhost:8083/buyer-item-service/emart/bill", bill);
  }
  setBuyerAndBills(currentBuyer: any) {
    this.currentBuyer = currentBuyer;
    this.allBills = currentBuyer.allBills;
  }

  //Accessing end point for buyer and retrieving its observable.
  getBuyer() {
    return this.http.get("http://localhost:8083/login-service/emart/buyer/" + this.currentBuyer.id);
  }
  addBuyer(buyer: Buyer){
    return this.http.post("http://localhost:8083/BuyerSignupService/emart/buyer", buyer);
    
    
  }
  

  addSeller(seller: Seller){
    return this.http.post("http://localhost:8083/SellerSignupService/emart/seller", seller);
    
    
  }

  isLoggedIn(){
    return this.currentBuyer;

  }
  getCurrentBuyer() {
    return this.currentBuyer;
  }
  //Accessing end point for validating the buyer credintionals.
  validateBuyer(username: string, password: string) {
    let credentials = username + ":" + password;
    let headers = new HttpHeaders();
    headers = headers.set("Authorization", credentials);
    return this.http.get("http://localhost:8083/login-service/emart/validate", { headers });


  }

  setSellerAndBills(currentSeller:any) {
    this.currentSeller = currentSeller;
    this.allBills = currentSeller.allBills;
  }


  validateSeller(username: string, password: string){
    /*let seller: Seller;
    let size = this.allSellers.length;
    for(let i=0; i<size; i++){
      if(this.allSellers[i].username==user && this.allSellers[i].password==password){
        seller = {
                    id: this.allSellers[i].id,
                    username: this.allSellers[i].username,
                    password: this.allSellers[i].password,
                    company: this.allSellers[i].company,
                    brief: this.allSellers[i].brief,
                    gst: this.allSellers[i].gst,
                    address: this.allSellers[i].address,
                    email: this.allSellers[i].email,
                    website: this.allSellers[i].website,
                    contact: this.allSellers[i].contact
                }
        break;
      }
    }
    return seller;*/



    let credentials = username + ":" + password;
    let headers = new HttpHeaders();
    headers = headers.set("Authorization", credentials);
    return this.http.get("http://localhost:8083/login-service/emart/validateseller", { headers });
  }


}
