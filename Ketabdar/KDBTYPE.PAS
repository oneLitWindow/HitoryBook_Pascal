{Programmed by Amin Safinejad,       }
{              Ali Golbin,           }
{              Mohammad Ostadhashemi }
{        http://tetta.5u.com         }
{        amin1986@gmail.com          }
unit kdbtype;
interface
const maxreserver=3;
type
    sorttype =(placeholder,group,nameonly,numberonly);
    statuetype =(normal,lended,lost,repair,notdefined);
     string240 = string[225];
     string30  = string[030];
     string6   = string[006];
     string7   = string[007];
     string100 = string[100];
     string60  = string[060];
     string10  = string[010];
     string8   = string[008];
     string25  = string[025];
     borrowerstype = array[1..maxreserver] of string8;
memberstype =record
                   number:string8;
                   name:string25;
                   books:array[1..3] of string6;
                   password:string10;
                   end;
booklisttype=record
                   number:string6;
                   recnumber:string7;
                   end;
booktype=record
               name:string30;
               number:string6;
               recnumber:string7;
               {shelf,stage}
               description:string240;
               group:string10;
               case statue:statuetype of
                    lended:(borrower,borrowdate,givebackdate:borrowerstype;daysleft:integer);
                    repair:(repairmsg:string60);
                    lost:(lostdate:string8;lostmsg:string60);
               end;
bookinlisttype=record
                     name:string30;
                     number:string6;
                     recnumber:string7;
                     {shelf,stage}
                     group:string10;
                     statue:statuetype;
                     end;


implementation
end.
{Programmed by Amin Safinejad,       }
{              Ali Golbin,           }
{              Mohammad Ostadhashemi }
{        http://tetta.5u.com         }
{        amin1986@gmail.com          }
