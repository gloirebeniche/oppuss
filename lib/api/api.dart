const String urlBase = "http://localhost:8000/api/";

// API URL SUR LE PACKAGES GESTION DES COMPTE
const String apiGestionCompte = '${urlBase}gestion/compte';

const String apiLogin = '$apiGestionCompte/login';
const String apiRegister = '$apiGestionCompte/employeur/register/';
const String apiLogout = '';
const String apiGetCurrentUser = '$apiGestionCompte/employeur/get_current_user/';

// API URL SUR LE PACKAGES REFERENTIEL DU BTP
const String apiReferentielBTP = '${urlBase}api/referentiel-btp';

const String apiDomaines = '$apiReferentielBTP/domaines';
const String apiTravaux = '$apiReferentielBTP/travaux';
const String apiMetier = '$apiReferentielBTP/metier';


// API URL SUR LE PACKAGES GESTION DES OFFRES
const String apiGestionOffres = '${urlBase}gestion/offres/';

const String apiOffres = '$apiGestionOffres/offres/';
const String apiOffreArchive = '$apiGestionOffres/offres-archive/';
const String apiCommentaire = '$apiGestionOffres/commentaires/';
const String apiReservation = '$apiGestionOffres/reservations/';
const String apiAppreciation = '$apiGestionOffres/appreciations/';

// API URL SUR LA RÉCUPERATION DE TOUS LES OUVRIER
const String apiGetWorkers = '$apiGestionCompte/workers/';