import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import IdeaSource from '../models/ideasource.model';
import { API } from '../shared/API';

@Injectable({
  providedIn: 'root'
})
export class IdeasourceService {
  constructor(private readonly http : HttpClient) { }
  public getIdeaSources() : Observable<Array<IdeaSource>>{
    return this.http.get<Array<IdeaSource>>(`${API}/IdeaSources`)
  }
}
