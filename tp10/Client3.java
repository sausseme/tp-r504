import java.io.*;
import org.apache.http.HttpEntity;
import org.apache.http.client.*;
import org.apache.http.client.methods.*;
import org.apache.http.impl.client.*;
import javax.json.*;

public class Client3
{
    public static void main(String[] args) 
    {
        try 
        {
            CloseableHttpClient client = HttpClients.createDefault ();
            
            // Définir l'URL en dehors de la boucle, sans saisie du titre
            String url = "http://" + args[0] ;

            while (true) {
                // Pas de saisie du titre, utilisez le titre constant défini ci-dessus

                HttpGet request = new HttpGet(url);

                System.out.println( "Executing request " + request.getRequestLine() );
                CloseableHttpResponse resp = client.execute(request);

                System.out.println( "Response Line: " + resp.getStatusLine() );
                System.out.println( "Response Code: " + resp.getStatusLine().getStatusCode() );

                InputStreamReader isr = new InputStreamReader(resp.getEntity().getContent());
                JsonReader jsonReader = Json.createReader(isr);
                JsonObject jsonObject = jsonReader.readObject();

                // Affichage des informations essentielles
                String releaseDate = getJsonValue(jsonObject, "Released");
                System.out.println("Date de sortie : " + releaseDate);

                String actors = getJsonValue(jsonObject, "Actors");
                System.out.println("Acteurs principaux : " + actors);

                // Récupération du tableau "ratings" et recherche du score sur Rotten Tomatoes
                JsonArray ratingsArray = getJsonArrayValue(jsonObject, "Ratings");
                String rottenTomatoesScore = "N/A"; // Par défaut, si aucune information n'est trouvée

                for (int i = 0; i < ratingsArray.size(); i++) {
                    JsonObject ratingObject = ratingsArray.getJsonObject(i);
                    if ("Rotten Tomatoes".equals(getJsonValue(ratingObject, "Source"))) {
                        rottenTomatoesScore = getJsonValue(ratingObject, "Value");
                        break; // Sortir de la boucle dès que l'information est trouvée
                    }
                }

                // Affichage du score Rotten Tomatoes
                System.out.println("Score Rotten Tomatoes : " + rottenTomatoesScore);

                // Ajout de la mention suivant le score des critiques
                int numericScore = parseNumericScore(rottenTomatoesScore);
                String critiqueMention = getCritiqueMention(numericScore);
                System.out.println("Critique : " + critiqueMention);

                jsonReader.close();
                isr.close();
            }
        }
        catch ( Exception ex ) 
        {
            System.out.println("Erreur !");
            ex.printStackTrace();
        }
    }

    // Méthode pour obtenir la valeur d'une clé dans un objet JSON
    private static String getJsonValue(JsonObject jsonObject, String key) {
        return jsonObject.containsKey(key) && !jsonObject.isNull(key) ?
            jsonObject.getString(key) :
            "Non disponible";
    }

    // Méthode pour obtenir la valeur d'une clé dans un tableau JSON
    private static JsonArray getJsonArrayValue(JsonObject jsonObject, String key) {
        return jsonObject.containsKey(key) && !jsonObject.isNull(key) ?
            jsonObject.getJsonArray(key) :
            Json.createArrayBuilder().build();
    }

    // Méthode pour convertir le score de chaîne à numérique
    private static int parseNumericScore(String score) {
        try {
            return Integer.parseInt(score.replaceAll("[^0-9]", ""));
        } catch (NumberFormatException e) {
            return -1; // Retourne -1 en cas d'échec de la conversion
        }
    }

    // Méthode pour obtenir la mention de critique suivant le score numérique
    private static String getCritiqueMention(int score) {
        if (score < 0) {
            return "Non disponible";
        } else if (score < 20) {
            return "Nul";
        } else if (score <= 50) {
            return "Bof";
        } else if (score <= 70) {
            return "Bien";
        } else {
            return "Très bien";
        }
    }
}
