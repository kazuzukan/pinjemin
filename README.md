# Pinjemin
Pinjemin is an android-based application is a means of borrowing and borrowing among students to facilitate students in finding their needs and benefits. This application consists of a collection of items to be lent with an agreement between the borrower and the applicant both regarding the price and terms of the loan. This application is based on Android so it will be very helpful and practical to use on mobile phones.

## Frontend Application (with flutter)
### Installation
1. Install Flutter -  Get the Flutter SDK (See.. https://flutter.dev/docs/get-started/install) 
2. Install Android Studio
3. Set up android device or android emulator
4. Clone https://github.com/kazuzukan/pinjemin.git into your directory
5. Go to project folder: ".\pinjemin\pinjemin"
6. Run "flutter packages get" on your terminal
```bash
$ flutter packages get
```
7. Run "flutter run" on your terminal or simply Run & Debug it on your IDE (Option: Visual Studio Code, Android Studio)
```bash
$ flutter run
```

## Development Progress
- [x] Implementation of Provider & Listener State Management
- [x] Splash Screen
- [x] Login & Register UI
- [x] Fetch and Post Product
- [x] Account UI


## Server (with node.js)
### Installation
1. Download Node.js installer
2. Install Node.js and NPM (see.. https://nodejs.org/en/docs/)
3. Install - Use XAMPP
4. Start Apache and Mysql service on your xampp control panel
5. Go to http://localhost/phpmyadmin/ in your browser 
6. Create new database with the name of: "pinjemin_development"
7. Clone https://github.com/kazuzukan/pinjemin.git into your directory
8. Go to project folder: ".\pinjemin\server"
9. Run NPM start on your terminal
```bash
$ npm start
```
10. Go to your browser, input http://127.0.0.1:3000/
11. If you see that, then pinjemin server is already running
```json
{"Hello":"Welcome to Pinjemin Apps."}
```

## API
> Pinjemin User
```bash
/user
```
> Pinjemin Product
```bash
/product
```
> Pinjemin Section
```bash
/section
```
> Pinjemin Order
```bash
/order
```