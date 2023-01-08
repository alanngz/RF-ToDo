using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ToDo.App.Shared
{
    public class TodoTask
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string Status { get; set; }
        public int TodoListId { get; set; }
    }
}
