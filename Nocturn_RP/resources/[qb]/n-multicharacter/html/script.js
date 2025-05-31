var Locale = null;
var Gender = null;
var Register = false;
var Button_Showed = false;
var Char_Data = null;
var Vehicles = null
var Animations = null
let Blacklist_Names = [];

Blacklist_Control = function (text) {
    return Blacklist_Names.some(word => text.toLowerCase().includes(word.toLowerCase()));
};

let Toggle_Queue = [];
let Toggle_Processing = false;

Process_Queue = function () {
    if (Toggle_Queue.length === 0) {
        Toggle_Processing = false;
        return;
    }
    Toggle_Processing = true;
    let { div_id, action } = Toggle_Queue.shift();

    if (action === "hide") {
        $("#" + div_id).css('opacity', '0');
        setTimeout(function () {
            $("#" + div_id).css('display', 'none');
            Process_Queue();
        }, 300);
    } else if (action === "show") {
        $("#" + div_id).css('display', 'flex');
        setTimeout(function () {
            $("#" + div_id).css('opacity', '1');
            Process_Queue();
        }, 200);
    }
};

Toggle = function (div_id, action) {
    Toggle_Queue.push({ div_id, action });
    if (!Toggle_Processing) {
        Process_Queue();
    }
};

Settings_List = function(listId, items, selectedItem, itemKey, selectedClass, postEvent) {
  const listElement = document.getElementById(listId);
  listElement.innerHTML = ``;
  
  items.forEach((item, index) => {
      let itemId = index + 1;
      let isSelected = itemId === selectedItem;
      let imgSrc = listId === "Animation_List" 
          ? `./img/animations/${item.scenario}.webp`
          : `https://docs.fivem.net/vehicles/${item.name}.webp`;
      let height = listId === "Animation_List" 
          ? '10.2407vh'
          : `4.2407vh`;
      
      $("#" + listId).append(`
          <div id="Item_Button" ${itemKey}="${itemId}" class="${isSelected ? selectedClass : ''} flex justify-center items-center w-[5.625vw] h-[10vh] shrink-0 rounded "
              style="background: ${isSelected ? 'rgba(178,199,250,0.4)' : 'rgba(255,255,255,0.25)'}">
              <img src="${imgSrc}" class="flex h-[${height}]">
          </div>
      `);
  });
  
  document.querySelectorAll("#" + listId + " #Item_Button").forEach((box) => {
      box.addEventListener("mouseenter", (event) => {
          if (!event.target.classList.contains(selectedClass)) {
              event.target.style.background = "rgba(178,199,250,0.4)";
          }
      });
      box.addEventListener("mouseleave", (event) => {
          if (!event.target.classList.contains(selectedClass)) {
              event.target.style.background = "rgba(255,255,255,0.25)";
          }
      });
  });
  
  document.querySelectorAll("#" + listId + " #Item_Button").forEach((button) => {
      button.addEventListener("click", (event) => {
          if (event.currentTarget.classList.contains(selectedClass)) return;
          document.querySelectorAll("#" + listId + " ." + selectedClass).forEach((selected) => {
              selected.classList.remove(selectedClass);
              selected.style.background = "rgba(255,255,255,0.25)";
          });
          event.currentTarget.classList.add(selectedClass);
          event.currentTarget.style.background = "rgba(178,199,250,0.4)";
          
          $.post(`https://${GetParentResourceName()}/${postEvent}`, JSON.stringify({
              char_idf: Char_Data.char_idf,
              item_id: event.currentTarget.getAttribute(itemKey)
          }));
      });
  });
}

Button = function (action, slotElement = null) {
    switch (action) {
        case "Show_Right_Side":
            if (slotElement.getAttribute('data-button') !== 'empty') {
              $.post(`https://${GetParentResourceName()}/Select_Ped`, JSON.stringify({ slotID: slotElement.getAttribute('id'), vehicle: JSON.parse(slotElement.getAttribute('data-button')).selected_vehicle, animation: JSON.parse(slotElement.getAttribute('data-button')).selected_animation }));
                Char_Data = JSON.parse(slotElement.getAttribute('data-button'));
                const [year, month, day] = Char_Data.dateofbirth.split("-");
                document.getElementById("Character_Day_Value").textContent = day;
                document.getElementById("Character_Month_Value").textContent = month;
                document.getElementById("Character_Year_Value").textContent = year;
                ["Job", "Cash", "Bank", "Nationality"].forEach(key => {
                    document.getElementById(`Character_${key}_Value`).textContent = key === "Cash" || key === "Bank"
                        ? `$${Char_Data[key.toLowerCase()].toLocaleString('en-EN')}`
                        : Char_Data[key.toLowerCase()] || '';
                });
                Toggle("Right_Side", "show");
                Settings_List("Animation_List", Animations, Char_Data.selected_animation, "anim-id", "selectedAnim", "Select_Animation");
                Settings_List("Vehicle_List", Vehicles, Char_Data.selected_vehicle, "vehicle-id", "selectedVehicle", "Select_Vehicle");
                
            } else {
                Register = true;
                Toggle("First_Menu", "hide");
                Toggle("Register_Menu", "show");
                $.post(`https://${GetParentResourceName()}/Select_Ped`, JSON.stringify({ slotID: slotElement.getAttribute('id'), vehicle: 'empty', animation: 'empty' }));
            }
            break;
        case "Create_Character":
            if (Button_Showed) {
              Button_Showed = false
              let Firstname = $("#Firstname_Input").val().trim(),
                  Lastname = $("#Lastname_Input").val().trim(),
                  Date_Of_Birth = $("#Date_Of_Birth_Input").val().trim(),
                  Nationality = $("#Nationality_Input").val().trim();

              if (!Firstname || !Lastname || !Date_Of_Birth || !Nationality || Blacklist_Control(Firstname) || Blacklist_Control(Lastname)) {
                    $("#Notify_Text").text(Locale.Error_Notify)
                    Toggle("Notify", "show");
                    setTimeout(function () {
                      Toggle("Notify", "hide");
                      Button_Showed = true
                    }, 2500);  
                  return;
              }
              $("#app").css('opacity', '0');
              $.post(`https://${GetParentResourceName()}/Create_Character`, JSON.stringify({
                  firstname: Firstname,
                  lastname: Lastname,
                  birthdate: Date_Of_Birth,
                  nationality: Nationality,
                  gender: Gender,
              }));
              setTimeout(() => $("#Register_Menu, #Play_Button, #Right_Side, #Create_Button").fadeOut(250), 2000);
            }
            break;
        case "Spawn_Character":
            $.post(`https://${GetParentResourceName()}/Spawn_Character`, JSON.stringify({
                char_idf: Char_Data.char_idf,
                skin: Char_Data.skin,
                model: Char_Data.model
            }));
            setTimeout(() => $("#app").css('opacity', '0'), 500);
            setTimeout(() => $("#Play_Button, #Create_Button, #Right_Side, #Register_Menu").css({ opacity: 0, display: 'none' }), 1500);
            break;
        case "Character_Settings":
            Toggle("Right_Side", "hide");
            Toggle("Left_Side", "hide");
            Toggle("Settings", "show");
            break;
        case "Register_Back":
            Register = false;
            Button_Showed = false;
            Gender = null;
            Toggle("Register_Menu", "hide");
            Toggle("Right_Side", "hide");
            Toggle("First_Menu", "show");
            $("#Firstname_Input, #Lastname_Input, #Date_Of_Birth_Input, #Nationality_Input").val('');
            $("#step1 path, #step2 path, #step3 path, #step4 path").attr("fill", "white").attr("fill-opacity", "0.25");
            $("#line1, #line2, #line3").css("background", "rgba(255,255,255,0.25)");
            $("#Name_Side, #Date_Of_Birth_Side, #Gender_Side, #Nationality_Side").css("background", "rgba(255,255,255,0.15)");
            $("#Name_Side path, #Date_Of_Birth_Side path, #Gender_Side path, #Nationality_Side path").attr("fill", "#FFFFFF").attr("fill-opacity", "0.5");
            $("#Male_Button, #Female_Button").css({ "background": "rgba(255,255,255,0.50)", "color": "rgba(255,255,255,0.75)" });
            $("#Male_Button_Background, #Female_Button_Background").css("background", "rgba(255,255,255,0.15)");
            $("#Firstname_Back_1, #Lastname_Back_1, #Date_Of_Birth_Back_1, #Nationality_Back_1").css("background", "rgba(255,255,255,0.15)");
            $("#Firstname_Back_2, #Lastname_Back_2, #Date_Of_Birth_Back_2, #Nationality_Back_2").css("background", "rgba(141,141,141,255)");
            $("#Firstname_Input, #Lastname_Input, #Date_Of_Birth_Input, #Nationality_Input").css("color", "rgba(255,255,255,0.75)");
            $("#Create_Button").css('opacity', '0');
            $.post(`https://${GetParentResourceName()}/Reset_Camera`);
            break;
        case "Settings_Back":
            Toggle("Settings", "hide");
            Toggle("Left_Side", "show");
            Toggle("Right_Side", "show");
            break;
        case "Delete_Character":
            Toggle("Accept_Cancel_Box", "show");
            break;
        case "Delete_Cancel":
            Toggle("Accept_Cancel_Box", "hide");
            break;
        case "Delete_Accept":
            $.post(`https://${GetParentResourceName()}/Character_Delete`, JSON.stringify({ char_idf: Char_Data.char_idf }));
            break;
    }
};

Necessary_Procedures = function() {
  Update_Inputs = function(step, inputIds) {
    let completed = inputIds.every(id => $(id).val().trim());
    let color = completed ? "#B2C7FA" : "white";
    let opacity = completed ? "1" : "0.25";
    let background1 = completed ? "rgba(178,199,250,0.15)" : "rgba(255,255,255,0.15)";
    let background2 = completed ? "rgba(178, 199, 250, 1)" : "rgba(141,141,141,255)";
    let textColor = completed ? "#252525" : "rgba(255,255,255,0.75)";
  
    $(`#step${step} path`).attr({ fill: color, "fill-opacity": opacity });
    $(`#line${step}`).css({ "background": color, "opacity": opacity });
  
    inputIds.forEach(id => {
        let baseId = id.replace("#", "").replace("_Input", "");
        $(`#${baseId}_Side`).css("background", background1);
        $(`#${baseId}_Side path`).attr({ fill: color, "fill-opacity": opacity });
        $(`#${baseId}_Back_1`).css("background", background1);
        $(`#${baseId}_Back_2`).css("background", background2);
        $(id).css("color", textColor);
    });
  }
  
  Effect_For_Inputs = function() {
    if (!Register) return;
  
    Update_Inputs(1, ["#Firstname_Input", "#Lastname_Input"]);
    Update_Inputs(2, ["#Date_Of_Birth_Input"]);
    Update_Inputs(3, ["#Nationality_Input"]);
  
    if (Gender !== null) {
        $("#step4 path").attr({ fill: "#B2C7FA", "fill-opacity": "1" });
        $("#Gender_Side").css("background", "rgba(178,199,250,0.15)");
        $("#Gender_Side path").attr({ fill: "#B2C7FA", "fill-opacity": "1" });
    }
  
    let allCompleted = ["#Firstname_Input", "#Lastname_Input", "#Date_Of_Birth_Input", "#Nationality_Input"].every(id => $(id).val().trim()) && Gender !== null;
  
    if (allCompleted && !Button_Showed) {
        $("#Create_Button").css('opacity', '1');
        Button_Showed = true;
    } else if (!allCompleted && Button_Showed) {
        $("#Create_Button").css('opacity', '0');
        Button_Showed = false;
    }
  }

  Listen_Inputs = function(inputId) {
    let input = document.getElementById(inputId);
    if (!input) return;
    input.addEventListener("blur", Effect_For_Inputs);
  }
  
  const Input_Fields = ["Firstname_Input", "Lastname_Input", "Date_Of_Birth_Input", "Nationality_Input"];
  Input_Fields.forEach(Listen_Inputs);

  const Birthdate_Input = document.getElementById("Date_Of_Birth_Input");
  Birthdate_Input.addEventListener("input", (e) => {
    let value = e.target.value.replace(/\D/g, "");
    let formattedValue = "";
    if (value.length >= 1) {
        let day = value.slice(0, 2);
        if (day.length === 2) {
            if (parseInt(day, 10) > 31) {
                day = "31";
            } else if (parseInt(day, 10) < 1) {
                day = "01";
            }
        }
        formattedValue = day;
    }
    if (value.length > 2) {
        let month = value.slice(2, 4);
        if (month.length === 2) {
            if (parseInt(month, 10) > 12) {
                month = "12";
            } else if (parseInt(month, 10) < 1) {
                month = "01";
            }
        }
        formattedValue += "-" + month;
    }
    if (value.length > 4) {
        const year = value.slice(4, 8);
        formattedValue += "-" + year;
    }
    e.target.value = formattedValue;
  });
  
  Birthdate_Input.addEventListener("blur", () => {
    let value = Birthdate_Input.value.replace(/\D/g, "");
    let day = value.slice(0, 2) || "01";
    let month = value.slice(2, 4) || "01";
    let year = value.slice(4, 8) || "2000";
    if (parseInt(month, 10) > 12) {
        month = "12";
    } else if (parseInt(month, 10) < 1) {
        month = "01";
    }
    if (parseInt(day, 10) > 31) {
        day = "31";
    } else if (parseInt(day, 10) < 1) {
        day = "01";
    }
    if (year.length < 4 || parseInt(year, 10) < 1900) {
        year = "2000";
    } else if (parseInt(year, 10) > 2025) {
        year = "2025";
    }
    Birthdate_Input.value = `${day}-${month}-${year}`;
    Effect_For_Inputs()
  });
}

document.addEventListener('DOMContentLoaded', function () {
  $.post(`https://${GetParentResourceName()}/Load`);
  Necessary_Procedures()
  window.addEventListener("message", (event) => {
    if (event.data.type === "Load") {
      Locale = event.data.locale;
      Object.keys(Locale).forEach(key => {
          let selector = `#${key}`;
          if ($(selector).length) {
              $(selector).text(Locale[key]);
          }
      });
      Blacklist_Names = event.data.blacklist
    } else if (event.data.type === "Open_Menu") {  
      const slots = event.data.slots;
      const characters = event.data.chars;
      const leftSide = document.getElementById('Left_Side');
      leftSide.innerHTML = '';
      Animations = event.data.animations
      Vehicles = event.data.vehicles
      slots.forEach((slot, index) => {
        const slotNumber = index + 1;
        let slotID = `${slotNumber}`;
        const character = characters[index]; 
        let slotHTML = '';
        let buttonData = '';
        if (character) {
          const { firstname, lastname, char_idf, job, cash, bank, dateofbirth, nationality, skin, model, selected_vehicle, selected_animation } = character;
          buttonData = JSON.stringify({
            type: "select",
            job: character.job,
            cash: character.cash,
            bank: character.bank,
            dateofbirth: character.dateofbirth,
            nationality: character.nationality,
            skin: character.skin,
            model: character.model,
            char_idf: character.char_idf,
            selected_vehicle: character.selected_vehicle,
            selected_animation: character.selected_animation
          });
          slotHTML = `
            <div class="flex items-center w-full h-[13.8889vh]  gap-x-[.9896vw] cursor-pointer full-slot hover-event" id="${slotID}" onclick='Button("Show_Right_Side", this)' data-button='${buttonData}'>
                <div class="flex justify-center items-center relative w-[7.3958vw] h-[13.1481vh]">
                  <img src="./img/play.png" class="absolute h-[3.2407vh]">
                  <svg xmlns="http://www.w3.org/2000/svg" width="7.8125vw" height="13.8889vh" viewBox="0 0 150 150" fill="none">
                    <path class="path1" d="M67.9289 7.07108C71.8342 3.16583 78.1658 3.16582 82.0711 7.07107L142.929 67.9289C146.834 71.8342 146.834 78.1658 142.929 82.0711L82.0711 142.929C78.1658 146.834 71.8342 146.834 67.9289 142.929L7.07108 82.0711C3.16583 78.1658 3.16582 71.8342 7.07107 67.9289L67.9289 7.07108Z" fill="white" fill-opacity="0.15"/>
                    <path class="path2" d="M67.9289 25.8211C71.8342 21.9158 78.1658 21.9158 82.0711 25.8211L124.179 67.9289C128.084 71.8342 128.084 78.1658 124.179 82.0711L82.0711 124.179C78.1658 128.084 71.8342 128.084 67.9289 124.179L25.8211 82.0711C21.9158 78.1658 21.9158 71.8342 25.8211 67.9289L67.9289 25.8211Z" fill="white" fill-opacity="0.25"/>
                  </svg>
                </div>
              <div class="flex justify-center flex-col w-fit h-full">
                <p class="text-white text-left [font-family:GilroyBold] text-[1.4583vw] font-bold leading-[normal]">${firstname.toUpperCase()} ${lastname.toUpperCase()}</p>
                <p class="text-[#B2C7FA] [font-family:GilroyRegular] text-[.9375vw] font-medium leading-[normal]">${Locale.Character_Slot_Text}</p>
              </div>
            </div>
          `;
        } else if (slot.enabled) {
          slotHTML = `
            <div class="flex flex-col">
              <div class="flex items-center w-full h-[13.8889vh] gap-x-[.9896vw] cursor-pointer empty-slot hover-event" id="${slotID}" onclick='Button("Show_Right_Side", this)' data-button='empty'>
                <div class="flex justify-center items-center relative w-[7.3958vw] h-[13.1481vh]">
                  <img src="./img/plus.png" class="absolute h-[3.2407vh]">
                  <svg xmlns="http://www.w3.org/2000/svg" width="7.8125vw" height="13.8889vh" viewBox="0 0 150 150" fill="none">
                    <path class="path1" d="M67.9289 7.07108C71.8342 3.16583 78.1658 3.16582 82.0711 7.07107L142.929 67.9289C146.834 71.8342 146.834 78.1658 142.929 82.0711L82.0711 142.929C78.1658 146.834 71.8342 146.834 67.9289 142.929L7.07108 82.0711C3.16583 78.1658 3.16582 71.8342 7.07107 67.9289L67.9289 7.07108Z" fill="white" fill-opacity="0.15"/>
                    <path class="path2" d="M67.9289 25.8211C71.8342 21.9158 78.1658 21.9158 82.0711 25.8211L124.179 67.9289C128.084 71.8342 128.084 78.1658 124.179 82.0711L82.0711 124.179C78.1658 128.084 71.8342 128.084 67.9289 124.179L25.8211 82.0711C21.9158 78.1658 21.9158 71.8342 25.8211 67.9289L67.9289 25.8211Z" fill="white" fill-opacity="0.25"/>
                  </svg>
                </div>
                <div class="flex justify-center flex-col w-fit h-full">
                  <p class="text-white text-left [font-family:GilroyBold] text-[1.4583vw] font-bold leading-[normal]">${Locale.Click_And_Create_Text}</p>
                  <p class="text-[#B2C7FA] [font-family:GilroyRegular] text-[.9375vw] font-medium leading-[normal]">${Locale.Empty_Slot_Text}</p>
                </div>
              </div>
            </div>
          `;
        } else {
          slotHTML = `
          <div class="flex flex-col" style="opacity: 0.5; pointer-events: none;" id="${slotID}">
            <div class="flex items-center w-full h-[13.8889vh] gap-x-[.9896vw] cursor-pointer empty-slot">
              <div class="flex justify-center items-center relative w-[7.3958vw] h-[13.1481vh]">
                <img src="./img/locked.png" class="absolute h-[3.2407vh]">
                <svg xmlns="http://www.w3.org/2000/svg" width="7.8125vw" height="13.8889vh" viewBox="0 0 150 150" fill="none">
                  <path class="path1" d="M67.9289 7.07108C71.8342 3.16583 78.1658 3.16582 82.0711 7.07107L142.929 67.9289C146.834 71.8342 146.834 78.1658 142.929 82.0711L82.0711 142.929C78.1658 146.834 71.8342 146.834 67.9289 142.929L7.07108 82.0711C3.16583 78.1658 3.16582 71.8342 7.07107 67.9289L67.9289 7.07108Z" fill="white" fill-opacity="0.15"/>
                  <path class="path2" d="M67.9289 25.8211C71.8342 21.9158 78.1658 21.9158 82.0711 25.8211L124.179 67.9289C128.084 71.8342 128.084 78.1658 124.179 82.0711L82.0711 124.179C78.1658 128.084 71.8342 128.084 67.9289 124.179L25.8211 82.0711C21.9158 78.1658 21.9158 71.8342 25.8211 67.9289L67.9289 25.8211Z" fill="white" fill-opacity="0.25"/>
                </svg>
              </div>
              <div class="flex justify-center flex-col w-fit h-full">
                <p class="text-white text-left [font-family:GilroyBold] text-[1.4583vw] font-bold leading-[normal]">${Locale.Click_And_Create_Text}</p>
                <p class="text-[#B2C7FA] [font-family:GilroyRegular] text-[.9375vw] font-medium leading-[normal]" style="opacity: 0.3;">${Locale.Locked_Slot_Text}</p>
              </div>
            </div>
          </div>
          `;
        }
        if (slotNumber !== 4) {
          slotHTML += `
            <div class="w-[.1042vw] h-[6.9444vh] shrink-0 [background:rgba(255,255,255,0.25)] rounded-sm ml-[3.8542vw]"></div>
          `;
        }
        leftSide.insertAdjacentHTML('beforeend', slotHTML);
      });
      $("#app").css('opacity', '1');
      $("#First_Menu").css('display', 'flex');
      $("#First_Menu").css('opacity', '1');
      $("#Left_Side").css('opacity', '1');
      $("#Left_Side").css('display', 'flex');
      
      document.querySelectorAll('.hover-event').forEach((slot) => {
        slot.addEventListener('mouseenter', function () {
          $.post(`https://${GetParentResourceName()}/Hover_Enter`, JSON.stringify({ slotID: this.id }));
        });

        slot.addEventListener('mouseleave', function () {
          $.post(`https://${GetParentResourceName()}/Hover_Leave`, JSON.stringify({ slotID: this.id }));
        });
      });
    } else if (event.data.type === "Notification") {  
      $("#Notify_Text").text(event.data.notifytext)
      Toggle("Notify", "show");
      setTimeout(function () {
        Toggle("Notify", "hide");
      }, 1500);  
    }
  });
  const maleButton = document.getElementById("Male_Button");
  const femaleButton = document.getElementById("Female_Button");
  const maleBackground = document.getElementById("Male_Button_Background");
  const femaleBackground = document.getElementById("Female_Button_Background");
  function resetButtons() {
      maleButton.style.background = "rgba(255,255,255,0.50)";
      maleBackground.style.background = "rgba(255,255,255,0.15)";
      femaleButton.style.background = "rgba(255,255,255,0.50)";
      femaleBackground.style.background = "rgba(255,255,255,0.15)";
      femaleButton.style.color = "rgba(255,255,255,0.50)";
      maleButton.style.color = "rgba(255,255,255,0.75)";
  }
  
  function selectButton(selectedButton, selectedBackground, gender) {
      resetButtons();
      selectedButton.style.color = "#252525";
      selectedButton.style.background = "rgba(178, 199, 250, 1)";
      selectedBackground.style.background = "rgba(178, 199, 250, 0.15)";
      Gender = gender;
      Effect_For_Inputs()
  }
  
  maleButton.addEventListener("click", () => selectButton(maleButton, maleBackground, 0));
  femaleButton.addEventListener("click", () => selectButton(femaleButton, femaleBackground, 1));
  
  [maleButton, femaleButton].forEach(button => {
      button.addEventListener("mouseenter", () => {
          button.style.opacity = "0.5";
      });
      button.addEventListener("mouseleave", () => {
          button.style.opacity = "1";
      });
  });

  $("#Play_Button, #Create_Button, #Delete_Button, #Edit_Button, #Register_Back_Button, #Back_Button, #Edit_Back_Button").on("mouseenter", function () {
    if ($(this).attr("id") === "Create_Button" && !Button_Showed) return;
    $(this).css({ "cursor": "default", "opacity": "0.6" });
});

$("#Play_Button, #Create_Button, #Delete_Button, #Edit_Button, #Register_Back_Button, #Back_Button, #Edit_Back_Button").on("mouseleave", function () {
    if ($(this).attr("id") === "Create_Button" && !Button_Showed) return;
    $(this).css("opacity", "1");
});

$("#Play_Button, #Create_Button, #Delete_Button, #Edit_Button, #Register_Back_Button, #Back_Button, #Edit_Back_Button").on("mousedown", function () {
    if ($(this).attr("id") === "Create_Button" && !Button_Showed) return;
    $(this).css("transform", "scale(1.05)");
});

$("#Play_Button, #Create_Button, #Delete_Button, #Edit_Button, #Register_Back_Button, #Back_Button, #Edit_Back_Button").on("mouseup", function () {
    if ($(this).attr("id") === "Create_Button" && !Button_Showed) return;
    $(this).css("transform", "scale(1)");
});
});