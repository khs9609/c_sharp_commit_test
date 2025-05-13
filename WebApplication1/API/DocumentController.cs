using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Web.Http;
using System.Xml.Linq;
using Aspose.Words;
using LoadOptions = Aspose.Words.Loading.LoadOptions;

namespace WebApplication1.API
{
    [RoutePrefix("api/documents")]
    public class DocumentController : ApiController
    {
        // HTTP GET 요청을 받아 PDF로 변환하여 반환
        [HttpGet]
        [Route("{id}.pdf")] // 요청 경로: api/documents/{id}.pdf
        public HttpResponseMessage GetDocumentPdf(int id)
        {
            // 1. HTML 문서 내용 가져오기 (실제 DB나 다른 서비스에서 가져오게 하자)
            var htmlContent = DocumentService.GetDocumentHtmlById(id);
            if (string.IsNullOrEmpty(htmlContent))
            {
                return Request.CreateResponse(HttpStatusCode.NotFound, "문서를 찾을 수 없습니다.");
            }

            // 2. HTML → PDF 변환
            var htmlBytes = Encoding.UTF8.GetBytes(htmlContent);
            using (var stream = new MemoryStream(htmlBytes))
            {
                var loadOptions = new LoadOptions(LoadFormat.Html.ToString());
                var doc = new Document(stream, loadOptions); // HTML을 Document 객체로 로드

                using (var pdfStream = new MemoryStream())
                {
                    // PDF로 저장
                    doc.Save(pdfStream, SaveFormat.Pdf);
                    pdfStream.Position = 0; // 스트림의 시작 위치로 돌아가기

                    // HTTP Response로 PDF 반환
                    var result = new HttpResponseMessage(HttpStatusCode.OK)
                    {
                        Content = new ByteArrayContent(pdfStream.ToArray()) // PDF를 바이트 배열로 응답
                    };

                    result.Content.Headers.ContentType = new MediaTypeHeaderValue("application/pdf");
                    result.Content.Headers.ContentDisposition = new ContentDispositionHeaderValue("inline")
                    {
                        FileName = $"document_{id}.pdf"
                    };

                    return result;
                }
            }
        }

        public static class DocumentService
        {
            public static string GetDocumentHtmlById(int id)
            {
                // 예시: 간단한 HTML 조합 (실제에선 RazorEngine이나 StringBuilder로 템플릿 처리)
                return $@"
            <html>
            <head>
                <style>
                    body {{ font-family: Arial; }}
                    .approval-line {{ border-bottom: 1px solid #000; margin-bottom: 20px; }}
                </style>
            </head>
            <body>
                <div class='approval-line'>결재선: 홍길동 → 김부장 → 박이사</div>
                <h2>전자결재 문서 제목 (ID: {id})</h2>
                <p>이것은 본문 내용입니다. 여기에 다양한 HTML 태그가 들어갈 수 있습니다.</p>
            </body>
            </html>";
            }
        }



        // GET api/<controller>
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET api/<controller>/5
        public string Get(int id)
        {
            return "value";
        }

        // POST api/<controller>
        public void Post([FromBody] string value)
        {
        }

        // PUT api/<controller>/5
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE api/<controller>/5
        public void Delete(int id)
        {
        }
    }
}