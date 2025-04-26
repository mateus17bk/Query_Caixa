using System;
using System.Text;

namespace gerador
{
    internal class Program
    {
        static void Main(string[] args)
        {
            int semente = 55;
            var message = $"Protocolo Seguro:Z21nbHJqamhvbmdtbW9naHJ6CAcMAgBycG1naXJpa2hnaGhoaQ==";

            // Extrai e limpa o conteúdo base64
            var texto = message.Split(':')[1].Trim();
            texto = texto.Split(' ')[0].Split("\r\n")[0].Split('\n')[0];

            // Decodifica Base64 e desofusca
            var desofuscadoUTF = Encoding.UTF8.GetString(Convert.FromBase64String(texto));
            var desofuscado = Desofuscar(desofuscadoUTF, semente);

            var dados = desofuscado.Split(';');
            var campanha = dados[0];
            if (campanha.Length > 4)
                campanha = campanha.Substring(campanha.Length - 4);

            var cpfcnpj = dados[1];
            if (cpfcnpj.Length < 11)
                cpfcnpj = cpfcnpj.PadLeft(11, '0');

            var produto = dados[2];
            var canal = dados[3];
            var dataProtocolo = dados[4].Substring(0, 6);

            Console.WriteLine($"Campanha: {campanha}");
            Console.WriteLine($"cpfcnpj: {cpfcnpj}");
            Console.WriteLine($"produto: {produto}");
            Console.WriteLine($"canal: {canal}");
            Console.WriteLine($"dataProtocolo: {dataProtocolo}");
        }

        public static string Desofuscar(string texto, int key, int n = 126)
        {
            return Ofuscar(texto, n - key, n);
        }

        public static string Ofuscar(string texto, int key, int n = 126)
        {
            char[] charArr = texto.ToCharArray();
            for (var i = 0; i < charArr.Length; i++)
            {
                var c = (int)charArr[i];
                if (c <= n)
                {
                    charArr[i] = Convert.ToChar((charArr[i] + key) % n);
                }
            }
            return new string(charArr); // Faltava retornar a string transformada
        }
    }
}
