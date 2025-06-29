export class Config {
  server: string;
  email: string;
  password: string; // switch to session based auth
  defaultOrg: string;
  reportData: any;
  constructor(options: any = {}) {
    this.server = options.server || 'http://127.0.0.1:8080';
    this.email = options.email;
    this.password = options.password;
    this.defaultOrg = options.defaultOrg;
  }
}