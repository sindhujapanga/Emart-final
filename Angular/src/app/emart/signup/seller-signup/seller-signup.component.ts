import { Component, OnInit } from '@angular/core';
import { Seller } from '../../seller';
import { EmartService } from '../../emart.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-seller-signup',
  templateUrl: './seller-signup.component.html',
  styleUrls: ['./seller-signup.component.css']
})
export class SellerSignupComponent implements OnInit {


  susername:string='';
  spassword:string='';
  scompany:string='';
  sbrief:string='';
  sgst:number;
  saddress:string='';
  semail:string='';
  swebsite:string='';
  scontact:number;
  sellers:any;

  constructor(protected emartService:EmartService,protected router:Router) { }

  ngOnInit(): void {
  }


  addSeller(){
    
    let seller:Seller = {
      id:0,
      username:this.susername,
      password:this.spassword,
      company:this.scompany,
      brief:this.sbrief,
      gst:this.sgst,
      address:this.saddress,
      email:this.semail,
      website:this.swebsite,
      contact:this.scontact
      
                        
    };
    
    this.emartService.addSeller(seller).subscribe(
      (response: any)=>{
        //this.sellers.push(response);
      }
    );
   /* this.busername = '';
    this.bpassword = '';
    this.bemail='';
    this.bmobile=null,
    this.bdate=null*/

    this.router.navigate(['/']);
  

}
}
