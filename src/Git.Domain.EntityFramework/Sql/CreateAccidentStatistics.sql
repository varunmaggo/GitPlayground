﻿CREATE TABLE [dbo].[AccidentStatistics] (
    [AccidentStatisticId] [int] NOT NULL IDENTITY,
    [TflId] [int] NOT NULL,
    [Latitude] [nvarchar](max),
    [Longitude] [nvarchar](max),
    [Location] [nvarchar](max),
    [Date] [datetime2](7) NOT NULL,
    [Severity] [int] NOT NULL,
    [Borough] [nvarchar](max),
    CONSTRAINT [PK_dbo.AccidentStatistics] PRIMARY KEY ([AccidentStatisticId])
)
CREATE TABLE [dbo].[Casualties] (
    [CasualtyId] [int] NOT NULL IDENTITY,
    [Age] [int] NOT NULL,
    [Class] [nvarchar](max),
    [Severity] [int] NOT NULL,
    [Mode] [nvarchar](max),
    [AgeBand] [nvarchar](max),
    [AccidentStatistic_AccidentStatisticId] [int],
    CONSTRAINT [PK_dbo.Casualties] PRIMARY KEY ([CasualtyId])
)
CREATE INDEX [IX_AccidentStatistic_AccidentStatisticId] ON [dbo].[Casualties]([AccidentStatistic_AccidentStatisticId])
CREATE TABLE [dbo].[Vehicles] (
    [VehicleId] [int] NOT NULL IDENTITY,
    [VehicleType] [nvarchar](max),
    [AccidentStatistic_AccidentStatisticId] [int],
    CONSTRAINT [PK_dbo.Vehicles] PRIMARY KEY ([VehicleId])
)
CREATE INDEX [IX_AccidentStatistic_AccidentStatisticId] ON [dbo].[Vehicles]([AccidentStatistic_AccidentStatisticId])
ALTER TABLE [dbo].[Casualties] ADD CONSTRAINT [FK_dbo.Casualties_dbo.AccidentStatistics_AccidentStatistic_AccidentStatisticId] FOREIGN KEY ([AccidentStatistic_AccidentStatisticId]) REFERENCES [dbo].[AccidentStatistics] ([AccidentStatisticId])
ALTER TABLE [dbo].[Vehicles] ADD CONSTRAINT [FK_dbo.Vehicles_dbo.AccidentStatistics_AccidentStatistic_AccidentStatisticId] FOREIGN KEY ([AccidentStatistic_AccidentStatisticId]) REFERENCES [dbo].[AccidentStatistics] ([AccidentStatisticId])
CREATE TABLE [dbo].[__MigrationHistory] (
    [MigrationId] [nvarchar](150) NOT NULL,
    [ContextKey] [nvarchar](300) NOT NULL,
    [Model] [varbinary](max) NOT NULL,
    [ProductVersion] [nvarchar](32) NOT NULL,
    CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY ([MigrationId], [ContextKey])
)
INSERT [dbo].[__MigrationHistory]([MigrationId], [ContextKey], [Model], [ProductVersion])
VALUES (N'201811271712193_InitialCreate', N'Git.Domain.EntityFramework.Migrations.Configuration',  0x1F8B0800000000000400E55BDD6EDB3614BE1FB0771074B50DA9E5A417DB02BB45EA2485D1E6077152ECAEA0255A264A511E496536863DD92EF6487B851DFD4B94284BB29DBA187AE350E4777E78CEE1E1E1E9BF7FFF337ABBF6A8F18CB9203E1B9BA783A1696066FB0E61EED80CE4E2D52FE6DB37DF7F37BA72BCB5F1299DF73A9C072B99189B4B2957E79625EC25F6901878C4E6BEF0177260FB9E851CDF3A1B0E7FB54E4F2D0C10266019C6E82160927838FA03FE9CF8CCC62B19207AE33B988A641CBECC2254E3167958AC908DC7E67B220797BE87081B5C0188DC5C73F8F887CFBF98C6052508389A61BA300DC4982F91047ECF9F049E49EE3377B68201441F372B0CF316880A9CC8719E4F6F2BD2F02C14C9CA17A65076202470D80DF0F475A2234B5DDE4BD366A643D062ACA850EA489363F3C2B68983999C85148424B669A854CF2794872B9A343EA8E09C18FAD92799FD809985FF4E8C494065C0F198E14072444F8CFB604E89FD016F1EFD2F988D59406951129005BE950660E89EFB2BCCE5E6012F74F24D1DD3B0CA40968A94E13481C42A9932F9FACC346E813D34A73833A582FA66D2E7F83D669823899D7B2425E66009D31011B452614721FEB8A0DBC935437C044664E0E014055C00BCDA346ED0FA2366AE5C8E4DF8691AD7648D9D7424417E620482002C923CD84E083CEBA528D9894B1C98D0256C5A4A24FCFD08D1AAF306CC3004D668AF136E212E0DF2C18E68EF7CEE07EE72FFA2DFA267E2466A55284E9080902C0916A6F1806934452CC92A9124F9BCF95C134DAEB9EF3DF83407A999F5F91171174B10C8DF3A75E607DCEEC0FA27BC2436D5309E7C6CE65B3BA9C2B67E661DD7232B8FC68D313AD546CFD09C2E3F92889CB2D3271017D7BE54FCBD70F16ED177429110078F53FB0D3161F675709641B3EF10735E308ED5F8F921C259EAED2DC2591A427A058624DEF48C0BC9EA23090B09377DA24261E94B0585846448EEE8CC77C7434D35DEEDC75F3BDB0DBC82E5E681692AAE2972F33B582F534EE10E61CBB0590EE674039B5BB4AEF296DD606F8E79261C277E0021FF13A201FC3DACEC70793A25EE5266B34F9B675F23896836F9ACAAFD58CFC5C10B217C9B44DA54CED11A1B2993BE628ED13EDCE5074F9EB2DC808EC90AB40A7B31367FAA08D78A429668E5146AACBB4C6A38189CAADA2968A259417A1FD271DFC2A172E6B3C0DD5E3B2DB2D0C3282776A389CF2438556686150A97F3700A5ECB1A177E1238F16291843C55CA90C40C4B1D38F8521E56F432569457862DDE622A70B9C56E41C92F14158C6C5B158882662BDCD466198505DB7312F56CEDE4B3997465F558BD40534B2C80D66DA57ABE97D5D342750D275C55732D5DB9A3331744CC0DA2416BDBDD775F4A4B4FE0CC63F31AAA151751D362ABA5A9B68E6ED06A05C75DA1FA9A8C18B3B8F43A7935EB5E8BF4620C0BA469882F192548D0908B95AF401A38BD265CC84B3808E7284C19268E5799D6109F34EE9D12D686A0EAE6A6EE9F2E0D7FC7CBBB544A55E05CDDB0C8F5606AA40CDC6420558CA8648E28E26D6A99139F061E6B5D316DC24FCA9545C464A83D465EAF2CC2E4A31D90F28264092A1FEE8295961CCB50E9687BA4B8A658448947DA23E4F97311251F6D8F9415138B40D96015676429C6A9BA8555F10B2572A91ED7CA1F0B87D39EFC303BF0BBBB9F7EA94ECBC5C25551D1FA6258135A54922AF9ACDBC97A928A54899178E86B58605C6B2AA2C4239DF4111792149DC4834763C359A2B0270B4ED3CDEE06AC5DA9D370A1C452D4B1B668D3022BAE9DD4A0C51F5E7ED7CA19556DF8A94DD63B459B3A80B6E1254C273571459F5756D5B8A7B4A04AB2CE0C42A5674CEF244F9279B794A74FC06DE415B24787441582A9080B8B59C16A6725A9B97C67E36CB80E7589236D4C5313386A7672EB85E7DB32CCAD37C296E2740FA4476B95958BA63A250BD8D98553B9588E924BDEF65E9FCAAD2F9E621AA0986710056E7CB38D90D81B841306B3DFE9841210309F708318596021E3CAAE79363C3D53DA848EA765C712C2A15DFB768EB03986841BB0F5A5A5E3D364A91F26A2B063370C7B46DC5E22FE8387D63F16D17A75BCEC8856EE6AD909ACD8B9E2C0EFB0CFEE2C74086C93B879EFE79D1B59FAE85F695FE92063F78E89AFDE9F70101728B424F4D9805243C24E26B60F7328B61AECC48CD24EB01B56BB23B32075E5D163CA1CBC1E9B7F4688E7C6F4B79ADCA106F4C4B8E3705C9D1B43E3AF3D79436DD2F6F2AFF20771859A87F8FFEDC6EFE59D577389E8FFB058FB78D4F3B1180C13F3D0521085AC53480E7967A50C70CF09B3C90A51AD44D55CBD576E14EE44464CFD728957988500AAE4BD88B7BDD364541567DDA6B8833E8D1FD6A4B247D73EEFEBDFB041E9AB7FC76C4FF5DD04D5473D4D4155DF08D5A63F20BE3442363CF7C15CE2F0DAE2AD55D347B069EC22A8A3A57F61D77519343519D451D0BD457FB51604ED4E69DE31DB741ED4752D54FB368EB0AD609FCA500CA4549D3B48B340B5560361A0F0BFB7204009E2E610616D8A61BB1400B23953B6F0D330A570944E51AF095822B8C5A20B2EC902D9123EDB5888A8E5326986BBF2E6D899B2BB40AE020922636F4E4B7611C6B326FA51474499E7D1DD2A6AAFDC8708C026092FE277EC5D40A893F17D5D4D74751061A04CB2E7702F659845BB9B0CE9D6672D8112F565F1FD117B2B0A60E28ECDD033EEC3DB93C01FB18BEC4D5A72D3836CDF88B2DA479704B91C7922C1C8D7C39F60C38EB77EF31F22E316ABC4380000 , N'6.2.0-61023')

CREATE INDEX [IX_Date] ON [dbo].[AccidentStatistics]([Date])
INSERT [dbo].[__MigrationHistory]([MigrationId], [ContextKey], [Model], [ProductVersion])
VALUES (N'201812041046106_OptimizeOrderBy', N'Git.Domain.EntityFramework.Migrations.Configuration',  0x1F8B0800000000000400E55B4B6FE33610BE17E87F10746A8BACE5640F6D037B1759675318CD0B71B2E86D414BB44C2C45B92495DA28FACB7AE84FEA5FE8E84D3D4DC976E245B1178722BF797066381CCEFEFBF73FA3F76B8F1ACF980BE2B3B1793A189A0666B6EF10E68ECD402EDEFC64BE7FF7ED37A38F8EB7363EA5F3DE86F3602513637329E5EADCB284BDC41E12038FD8DC17FE420E6CDFB390E35B67C3E1CFD6E9A98501C2042CC3183D044C120F477FC09F139FD9782503446F7C0753918CC39759846ADC220F8B15B2F1D8FC85C8C1A5EF21C2061F01446EAE387CFCC3E75F4CE38212041CCD305D980662CC974802BFE74F02CF24F7993B5BC100A28F9B1586790B44054EE438CFA7EB8A343C0B45B2F28529941D08091C76033C7D9BE8C82A2FEFA56933D321683156542875A4C9B17961DBC4C14CCE420A4212FB726E1A65BAE713CAC3356D3A1FC41B36A8013C319A979D64A6041617FE3B3126019501C7638603C9113D31EE833925F6AF78F3E87FC16CCC024A55A1402CF8561880A17BEEAF30979B07BC681275EA98865504B2CA48194E1B48AC9B29936FCF4CE316D843738A33AB52F438933EC7BF60863992D8B94752620E46310D11412B15764AC41F17743BB976886B6044060E4E51C01BC0C14DE306ADAF3173E5726CC24FD3B8226BECA42309F21323100F6091E4C17642E0642F45C94EBCE3C0842E61D35222E1EF47085C9D37608621C6467B9D700B216A900F7644FBE0733F7097FB17FD163D1337526B89E2040988CE9260611A0F984653C492AC124992CF9BCBF9E78AAB001FDCF71E7C9AC3D4CEFBFC88B88B2508E56B4C9EF901B73B08F0092F894D1BD84F3E6EE3BE655A85F9B6B975BC8FAC3C48B786EE5C2BBB45EC1CE7480275CA509FF8ACAE7DA9B07CE1E2DD82F28422210E1EBEF61B7942E33938CBA0D90F88392F18DE6ADCFE50512E757EAD289746955E91220B41BB058A0CE648E244C24F9F30A12C7DA92891900CC91D9D3DEFE1D82B5BB3CE11A967CC81A798721EAFA6E28A2237BFBC69597662C98F57D759E4538DB9AFF1C2EE3898D30DECA66A4EC53DBAC1DE1CF34C0E4EFC0082FE274403F87B58D9D2E2744ADCA5CC669FB6CFBE4212D16CF25955D1B14AD5C10B217C9B448AABA41735465124FE9139469780971F3F6A0E73039A262BD02D6CCAD8FCA122A226952CFFCAA9D45E728BE48683C169594F8A4EDA55D5E63E4D3268F9522E8212C2F5F5A495A61E4A4DB13B4F7C26C1B132D3ACA1114EC16B59E3C14F02274E2C92B85796342431C3B2091CFC2B8F2A6D5256545804562F3D1540D586B7E0E4778F0A8AB2C1251045BF158E1A321065894EC6523E6A3BFA7326655151564FD8D43215D8BA8D2D1FF9453569A8B0F5D0AB6A50DBC93BBBB922686E202DDAD371EB7D292F3D96333FCE2BB2565C924D4BB75643ED767483562B3818955A6E3262CCE242EEE4CDAC7B65D38B312C90A625EA64942077432E2E7D05D2C0E915E1425EC2913947611E3171BCCAB496A8D5E0F029E1C6C054DDDE3420A44BC3DFF1F296D4BC2E9A95A07385C332D783C9913A709B89D4A14445784411D729894E7C1A784CBBF0DA869F543D55C464481F232F7BAA30F96807A4BCAE5980CA87BB60A595CB22543AAA8F149726559478441F214FAC55947C541F29AB49AA40D96015676495CCB3EC1A56C5374AD1ABEC755A3EA91C557BF2452511E8EE826D8B9B34AD16BB54653717D0DAD0A23256C16FDD4E169454B10A8CC443AF6185717D4A4589473AE9232E3E9574120F1E8D1D6729C39EAC384F44BB1B71CBDA262D2B951855CF8DB51D0DACB8C45283167F78F99D2B6657B561A82191EF1877EA20F4034D9862364498B65CB3AACE3DA509559275E6102A3F637B4789928C5C53A23EE1B7955BC8291D12D515A622AC4466B5AD9DD554CEF03B9B69EB65A95B5CD131D2C64052B3A31AD7A1AFCB4435EE8C9A02750FAE476B9F958B68794A16C4B30B69E9E2394A2E81DB3B8B2AB7C2788A6980629E4114B811CE3642626F104E18CC7EA7134A40C07CC20D626481858C6BC4E6D9F0F4ACD494743C0D4296100EEDDE2574841D3824DC82ADCF341D1F3A0B4D3711851D5B6ED833E2F612F1EF3CB4FE5E45EBD556B3235AB175A6045629C84E9983D763F34FE3AFAE94D4DE19077E874D7F675B28DC736C93B8CDF0C79DFB6CFAEC5CA9BBA683AAFB3471BC7AA7C441DC47698EE8B30585D6889D6C7D1F06A1363DECC44CA9B161372CBD035791BAD9EB42C47363FA5B4DE651037A62DC7138ECCE8DE1B680D0A355E1951B020EE20C353D00FFDBADDFD38B73ED73DEAE8F9A0D8F55BD9FAEC144310F6D0651C85F85E490C1568A0CF79C309BAC106D91AC9AF7F7CAB2C25DC9C895BF5CE21566214055FE5EE475EF4819DD92EB6E53DE811FEA0F6F60CAD36FBF17FFAFDABCDAEA8DC76C5DF5FD0DD507C586226EDBFFBFD0EB59882FA5904ECF7D309C38FC6ABCF536F4366C6A09AB1FEBE835BFF737F53ED49251BED551697A157FD5D688969D6B7C53D5EB89A8EBA8A8EB2E39D296877D2BA66238A50AE1419A19AAB5220815CAFF55833026889B4384B53186ED4290C8E64CD9C24F435989A3744AF9A28125826B32BAE0922C902DE1B38D8588BA4593B6BE8FDE1C3B537617C855204164ECCD69E1852C8C796DF4A38E8D22CFA3BB55D419BA0F11804D12DEF4EFD887805027E3FBAA9A28374184C134C9BEC3BD946116EE6E32A45B9F690225EACBCE8047ECAD2880893B3643CFB80F6F4F025F6317D99BB4E4D70CB27D238A6A1F5D12E472E48904235F0F7F820D3BDEFADD7F3D35C079B2390000 , N'6.2.0-61023')

IF EXISTS (SELECT name FROM sys.indexes WHERE name = N'IX_Location' AND object_id = object_id(N'[dbo].[AccidentStatistics]', N'U'))
    DROP INDEX [IX_Location] ON [dbo].[AccidentStatistics]
INSERT [dbo].[__MigrationHistory]([MigrationId], [ContextKey], [Model], [ProductVersion])
VALUES (N'201903030152357_AutomaticMigration', N'Git.Domain.EntityFramework.Migrations.Configuration',  0x1F8B0800000000000400E55B4B6F1B3710BE17E87F58ECA92D1CADED1CDA1A5202478E0BA1F103961DF41650BBD48A0897AB925C5742D15FD6437F52FF4287DA17F729EE4A721414B9C85CF29B076786C3E1E4DFBFFF19BE5D05D47AC65C90908DECB3C1A96D61E6861E61FEC88EE4FCD54FF6DB37DF7E337CEF052BEB633AEFB59A072B9918D90B2997178E23DC050E901804C4E5A108E772E0868183BCD0393F3DFDD9393B733040D8806559C387884912E0CD1FF0E738642E5ECA08D19BD0C35424E3F065BA41B56E5180C512B97864FF42E4E02A0C106183F70022D7D71C3EFE11F2CFB6754909028EA698CE6D0B31164A2481DF8B2781A79287CC9F2E6100D1C7F512C3BC39A20227725CE4D34D453A3D572239F9C214CA8D84040EBB019EBD4E74E49497F7D2B49DE910B4182B4A49BDD1E4C8BE745DE26126A78A8290C4BD9AD95699EEC59872B5A64DE78378C30635802756F3B293CC94C0E2D4BF136B1C5119713C6238921CD113EB3E9A51E2FE8AD78FE167CC462CA254170AC4826F850118BAE7E11273B97EC0F32651279E6D394520A78C94E1B481C4BA9930F9FADCB66E813D34A338B32A4D8F531972FC0B66982389BD7B2425E660141385085AA9B05322FE38A7DBC9B5437C004664E4E11405BC011CDCB66ED0EA0366BE5C8C6CF8695BD76485BD7424417E6204E2012C923CDA4E089CECA528B989771C98D0156C5A4A44FD7E84C0D57903A61862EC66AF136E21440DF2C18E68EF421E46FE62FFA2DFA267E26FD45AA2384602A2B32458D8D603A69B296241968924C9E7F5D5EC53C555800F1E060F21CD616AE77D7A44DCC712840A0D264FC388BB1D04F88817C4A50DEC271FB771DF32ADC27CDBDC3ADE874E1EA45B4377AE95DD22768E7324813A65A84F7CD6D7BE5458BEF4F16E41794C9110070F5FFB8D3CCA780ECE3268F61D62DE0B86B71AB73F54944B9DDF28CAA551A557A4C842D06E81228339923891F0D3274C684B5F2A4A242415B9A3B3E73D1C7B656B363922CD8C390A3453CEE3D5445C53E4E7973723CB4E2C3945D10DB9AFE1C2CE7898D335ECA46E4AC5FDB9C1C10CF34C064EC20802FE474423F8FBB4B29DC5E994F80B99CD3E6B9F7D8D24A2D9E4F3AA926375EA839742842ED928AD925AD4184491F87BE6595D825D7EF4E8F9CB0D689A2C41B7B02923FB878A888654B2DC2BA7527BC12D923B1D0CCECA7AD274D2AEAA36D76992C1C88F7211B4F06DAE27A314F5506A8A5D791C32098E9599660D0D3505AF648DF73E099C38B048625E595245628A651338F8571E51DAA4ACA8B008AC5F782A80BA0D6FC1C9EF1D15146D834B209A7E2B1C35641FDA12936CA57CCC76F4E74CCAA2A29C9EB0A9656AB0751B5B3EEE8B6A325061EB8157D5A0B1937776734DD0DC405AB467E2D6FB525E7A24677E9C57639DB81C9B966D9D86BAEDF0062D9770306A75DC64C49AC645DCF1AB69F7AA66106338204D4BD4C92841DE867C5CFA0AA481D36BC285BC82237386540E31F682CAB496A8D5E0F029E1C6C054DDDE3420A44BD5EF78794B5A5E17CD4AD0B9C261991FC0E48D3A709B89D4A16C0AF088226E520E1D87340A9871D1B50D3FA978EA88C99039465EF2D461F2D10E48794DB300950F77C14AAB9645A874D41C292E4BEA28F18839429E54EB28F9A83952568FD481B2C12ACED0299967D9359C8A6F94A257D9EB8C7C523BAAF6E48B5A22D0DD05DB1637695A2F74E9CA6E2E9EB5A16D4A5805BFF53B595052C12A30120F7D092B8C6B533A4A3CD2491F71E1A9A49378F068EC384B19F664C57922DADD885BD6366959ABC2E87A6EACEB1860C5E5951AB4F8C3CBEF5C31BBAA0D430D897CC7B85307611E68548AD91061DA72CDAA3AF794265449D69983527EC6F68E122519B9A1447DC26F2BB790537A64535798085585CCEA5A3BABA99CE17736D3D6CB52B7B86262A48D81A466470DAE435F97891ADC190D05EA1E5C8FD63E2B17D1F2942C886717D2D2C573985C02B77715556E85F114DB02C53C832870239CAE85C4C1404D184C7FA7634A40C07CC20D62648E858C6BC4F6F9E9D979A921E9789A831C213CDABD43E808BB6F88DA82AD4F341D1F390B0D371B0A3BB6DBB067C4DD05E2DF0568F5BD8ED6ABA56647B462DBCC4E607A6B8C07BF554FDF794D5577C23CBC1AD97F5A7F297FC12E89BB087FDCB98DA6CFE6949A673A28A04F8FC6176F8438888768BD0F7DB6A0D0F9B09305EEC320F49E869D9829F52DEC866576A66A52377B9D42BCB026BFD5241735A027D61D87F3ECC23A55EEBA177F68C8ED5EFEBDFF20CE50F3C4FFBFDDFA3D3D2AD7BED8EDFA6ED9F01ED5FB751A4C1473653388428A2A248724B55247B8E784B96489688B64D5D4BE5722A576252357FE728597982980AAFCBDC89B5E8332BA25D7DDA6BC03BFC51FDEC0B4D7DD7E8FFA5FB579B595148FD9BAEA5B18AA6F860D75DAB6FF5E61D69610DF3B219D9E85603871F83578CE6D685F58D712D63FD6D16B7ED26F6A6FA825A37DABA3D2F4F0FD45BB1F5A76AEF1D9D4ACEDA1AE69A2AE81E448BB1AF6AD988AE1948A8007E957A89683205468FF150DC298207E0EA1CA5F0CBB852091CD99B0799886B21247E994F245034B04D76474C925992357C267170BB169064D3AF7DE0733EC4DD85D24979104917130A385473015F3DAE86F9A328A3C0FEF969BC6CF7D88006C1275D3BF63EF2242BD8CEFEB6AA2DC04A18269927DABBD942A0BF7D719D26DC80C8112F56567C0230E9614C0C41D9BA267DC87B727813F601FB9EBB4AAD70CB27D238A6A1F5E11E473148804235F0F7F820D7BC1EACD7F79E0066491390000 , N'6.2.0-61023')