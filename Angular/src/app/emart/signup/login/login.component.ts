import { Component, OnInit } from '@angular/core';
import { EmartService } from '../../emart.service';

import { Router, ActivatedRoute } from '@angular/router';
import { LoginService } from 'src/app/login.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
  sign: string;
  errorMessage: string;
  username: string;
  password: string;
  currentBuyer: any;
  buyer: boolean;
  currentSeller:any;
  seller:boolean;
  constructor(protected emartService: EmartService, protected router: Router, protected activatedRoute: ActivatedRoute,
    protected loginService:LoginService) { }
  ngOnInit(): void {
    this.errorMessage = "";
  }
  validate() {
    if (this.sign == 'buyer') {
      this.emartService
        .validateBuyer(this.username, this.password)
        .subscribe(
          (response) => {
            this.currentBuyer = response;
            this.emartService.setBuyerAndBills(this.currentBuyer);

            if (this.currentBuyer.id != 0) {
              this.loginService.loginBuyer(this.currentBuyer.id);
               // sessionStorage.getItem('key');  
              this.router.navigate(['item-list']);
            }
           else 
           {
              this.errorMessage = "Invalid username/password";
            }
          }
        );
    }

    if(this.sign == 'seller'){
      this.emartService.validateSeller(this.username, this.password)
      .subscribe(
        (response) => {
        this.currentSeller = response;
        this.emartService.setSellerAndBills(this.currentSeller);
        if (this.currentSeller.id != 0) {
          this.loginService.loginSeller(this.currentSeller);
          //essionStorage.getItem('key');  
         // this.router.navigate(['item-list']);
        }
        else {
          this.errorMessage = "Invalid Username/Password";
        }
      }
        );
      }
    }
  }






