using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ToDo.App.Shared
{
    public class TodoList
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public DateTimeOffset WhenCreated { get; set; }
        public ICollection<TodoTask> Tasks { get; set; } = new HashSet<TodoTask>();
    }
}
