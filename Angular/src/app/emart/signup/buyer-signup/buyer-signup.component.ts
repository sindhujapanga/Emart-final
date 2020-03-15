import { Component, OnInit } from '@angular/core';
import { EmartService } from '../../emart.service';
import { Buyer } from '../../buyer';
import { Router } from '@angular/router';

@Component({
  selector: 'app-buyer-signup',
  templateUrl: './buyer-signup.component.html',
  styleUrls: ['./buyer-signup.component.css']
})
export class BuyerSignupComponent implements OnInit {
  busername:string='';
  bpassword:string='';
  bemail:string='';
  bmobile:number;
  bdate:Date;
  buyers: any;


  constructor(protected emartService: EmartService,protected  router:Router) { }

  ngOnInit(): void {
   
  }
  addBuyer(){
    
    let buyer:Buyer = {
      id:0,
      username:this.busername,
      password:this.bpassword,
      email:this.bemail,
      mobile:this.bmobile,
      date:this.bdate
                        
    };
    
    this.emartService.addBuyer(buyer).subscribe(
      (response: any)=>{
        //this.buyers.push(response);
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

