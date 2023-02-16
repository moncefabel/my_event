import {getFirestore} from '@firebase/firestore'
import {getStorage} from 'firebase/storage'
import { initializeApp } from 'firebase/app';
import {getAuth} from 'firebase/auth'

const firebaseConfig = {
  apiKey: "AIzaSyAcfbBOD0i8flYQmuIy0kIR3B9UdM2nXSE",
  authDomain: "l3h1-f185d.firebaseapp.com",
  projectId: "l3h1-f185d",
  storageBucket: "l3h1-f185d.appspot.com",
  messagingSenderId: "1001469802186",
  appId: "1:1001469802186:web:9d596227512e58d385a633",
  measurementId: "G-9DJ2GQJ1HT"
};


const app = initializeApp(firebaseConfig)
const db = getFirestore(app)
const auth = getAuth(app)
const storage = getStorage(app)
export = {db,auth, storage}
