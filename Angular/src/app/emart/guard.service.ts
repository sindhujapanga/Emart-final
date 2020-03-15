import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, RouterStateSnapshot, Router } from '@angular/router';
import { EmartService } from './emart.service';

@Injectable({
  providedIn: 'root'
})
export class GuardService {
  constructor(protected emartService: EmartService,protected router: Router){}
  canActivate(route:ActivatedRouteSnapshot,state:RouterStateSnapshot):boolean
  {
    const userExist= !!this.emartService.isLoggedIn();
    if(userExist)
    {
        return true;
      }
      else
      {
          this.router.navigate(['/']);
          return false;
      }
  }
}
