function [minfreq,maxfreq] = classify(Filename)
% "εκπαίδευση" με ταξινομητη Naive Bayes για την κατηγοριοποίηση  
% σε 2 κλάσεις (Ήχος α΄, ήχος πλ.δ΄) σύμφωνα με την "συχνότητα"


%αντιστοίχηση ονόματων αρχείων βάσης για εκπαίδευση και πρόταση με τα "πλήρη" ονόματα για τον α΄ήχο
  ida = {'Hxosa1','Hxosa2','Hxosa3','Hxosa4','Hxosa5','Hxosa6','Hxosa7'};
%aValueSet = {'Κύριε εκέκραξα Ήχος α Αργοσύντομον(μέλος)','Κατευθυνθήτω Ήχος α Αργοσύντομον(μέλος)','Α Στιχηρό-Τας εσπερινάς ημών ευχάς Ήχος α Αργοσύντομον (μέλος)'
%,'Β Στιχηρό-Κυκλώσατε λαοί Σιών Ήχος α Αργοσύντομον (μέλος)','Γ Στιχηρό-Δεύτε λαοί υμνήσωμεν Ήχος α Αργοσύντομον (μέλος)','Πάσα πνοή Ήχος α Αργοσύντομον (μέλος)'
%,'Αινείτε αυτόν Ήχος α Αργοσύντομον (μέλος)'};       %ιδανικό value set αλλά κάπου αντιετωπίζει θέμα οπότε greeklish...
  Valuea = {'kyrie ekekraja','Kateyuynuhtw ','A stixhro','B stixhro','G stixhro','Pasa pnoh','Aineitai ayton'};
%περιέχει κλειδιά από το keySet, το καθένα αντιστοιχίζεται σε μια αντίστοιχη τιμή από το valueSet.
%Τα ορίσματα εισόδου keySet και valueSet έχουν τον ίδιο αριθμό στοιχείων και το keySet να έχει μοναδικά στοιχεία. 
  titlesa = containers.Map(ida,Valuea); 


%αντιστοίχηση ονόματων αρχείων βάσης για τον πλ. δ' ήχο
  idpld = {'Hxospld1','Hxospld2','Hxospld3','Hxospld4','Hxospld5','Hxospld6','Hxospld7'};
  Valuepld = {'kyrie ekekraja','Kateyuynuhtw ','A stixhro','B stixhro','G stixhro','Pasa pnoh','Aineitai ayton'};
  titlespld = containers.Map(idpld,Valuepld); 


%Συλλογή "στοιχείων" για τα 7 ηχ. αρχεία σε ά ήχο
  c=cell(2,7); % πίνακας κελιών 7 θέσεων, κάθε κελί μπορεί να περιέχει οποιονδήποτε τύπο δεδομένων. 
  for i=1:7
    c(1,{i})=audioread(sprintf('Hxosa%i.wav',i)); %Διαβαζει το ηχητικό αρχείο, την 1η φορά i=1 άρα το αρχείο με τίτλο Hxosa1.wav που υπάρχει στον ίδιο φάκελο με το πρόγραμμα
                                               %και βάζει στο cell to 'sample' και το FS
% εδώ θα έπρεπε να υπολογίζεται σωστά , η μικρότερη και η μεγαλύτερη συχνότητα του ηχητικού αρχείου
    value{i} = fft(c{i});
    Hxosa_freq{i}= mean(value{i});  %μέσος όρος της συχνότητας για τα 7 ηχητικά αρχεία σε α΄ήχο  
    %Hxosa_freq_Rounded{i}=round(Hxosa_freq{i}*100)/100; %Στρογγυλοποίηση και αποθήκευση των τιμών
    %aFreq=cell2mat (Hxosa_freq_Rounded);
  end    

%αντίστοιχα για τα ηχητικά αρχεία που είναι σε ήχο πλ.δ΄
  c=cell(1,7);
  for i=1:7
    c(1,{i})=audioread(sprintf('Hxospld%i.wav',i));
    value{i} = fft(c{i});
    Hxospld_freq{i}= mean(value{i});
    %Hxospld_freq_Rounded{i}=round(Hxospld_freq{i}*100)/100;
    %pldFreq=cell2mat (Hxospld_freq_Rounded);
  end    


%Διάβασμα του νέου ηχητικού κομματιου και αυτόματη κατάταξη αυτού σύμφωνα με την ελάχιστη και μέγιστη συχνότητα σε ήχο α΄ ή πλ. δ΄:
  [sample,FS]=audioread(Filename);

% εδώ πάλι χρειάζεται σωστός υπολογισμός....
  value = fft (sample);
  freq= mean(value);
  %minfreq =....
  %maxfreq = ... 
 % To minfreq και maxfreq είναι το αποτέλεσμα της συνάρτησης και θα τα γυρίσει πίσω εκεί που την καλέσαμε
  

endfunction



