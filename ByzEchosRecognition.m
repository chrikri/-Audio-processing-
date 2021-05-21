##Σχεδίαση και υλοποίηση ενός συστήματος Επεξεργασίας Ομιλίας και Ήχου :ByzEchosRecognition
##Εργασία στο μάθημα Επεξεργασία Ομιλίας και Ήχου
## Author: Christiana Krielesi p2017129
## 2021-05-21
%Υλοποίηση ενός συστήματος που δέχεται ένα ηχητικό αρχείο με κάποιο ψαλμό βυζαντινής μουσικής από τον χρήστη 
%και στη συνέχεια αυτό θα επιστρέφει τον ήχο στον οποίο ανήκει και τα ονόματα των ψαλμών που κατηγοριοποιούνται 
%στον ίδιο ήχο και υπάρχουν μέσα στη Β.Δ. του συστήματος.



printf ("\nWelcome! \n This is a system that accepts an audio file of a Byzantine music psalm and recognizes \nto which echos (ήχος) it belongs.\n More, it suggests some other psalms that are categorized into the same sound that exists within the system. \n");
Filename =input ("\nEnter the audio file name (in .wav format) : \n" , "s")

  %if strcmp(Filename,'*.wav')==1 %έλεγχος για το αν μας έχει δώσει τον τύπο του ηχ.αρχείου σε .wav
  %else 
  %  Filename =input ("\nPlease give a audio file with .wav format! : \n" , "s")
  %endif

    c(1,{i})=audioread(sprintf('Hxospld%i.wav',i));

% Επειδή δεν κατάφερα να βρω μόνη μου τις συχνότητες από τα αρχεία κάνω τις παρακάτω υποθέσεις
%Υποθέτω ότι για το ήχο α΄,σύμφωνα με την βάση και την κορυφή του : minfreq =262 maxfreq = 523
% Υποθέτω για το ήχο πλ.δ΄,σύμφωνα με την βάση και την κορυφή του : minfreq =288 maxfreq = 576
% με βάση αυτές τις υποθέσεις βάζω τους παρακάτω ελέγχους


classify(Filename);

    %τις μεταβλητές minfreq και maxfreq τις παίρνουμε από την συνάρτηση classify
  if (minfreq>258 && minfreq<267) &&  (maxfreq>520 && minfreq<525)  %εφόσον το αρχείο που έδωσε ο χρήστης ταιριάζει στην παραπάνω συνθήκη και άρα είναι α΄ήχου 
                                                           %θέλουμε να του επιστρέφει σε μορφή κειμένου την κατηγορια που ανήκει το κομμάτι 
    message1 = sprintf('This hymn belongs to the echo (ήχο) --> α΄');
  
  %αλλά και τα ονόματα όλων των ηχητικών αρχείων που έχει η "Β.Δ." του συστήματος...για αυτό τον λόγο
  %έφτιαξα το container map πιο πάνω, για να μπορεί να δεί τους τίτλους των ψαλμών και κάποιες πληροφορίες ίσως
  % όπως σε ποιό μέλος ανήκει (σύντομο,αργοσύντομο κτλ.)(valuea) και το όνομα με το οποίο υπάρχει μέσα στη Β.Δ.(ida)
  % (ίσως χρειαστεί αν μετέπειτα προστεθεί στο πρόγραμμα η λειτουργία να μπορεί και να ακουεί ο χρήστης
  %τους ψαλμούς που τους προτείνει )
  %ida(titlesa),Valuea(titlesa)
    msgbox(message1); %εμφάνιση με μορφή κουτιού διαλόγου, μόνο το κείμενο
  
  else message2 = sprintf('This hymn belongs to the echo (ήχο) --> πλάγιο δ΄.')
    % idpld(titlespl),Valuepld(titlespld);
    msgbox(message2);
  endif

