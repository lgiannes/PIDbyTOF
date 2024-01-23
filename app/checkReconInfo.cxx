// Example program.
// This program will retrieve recon information;
// Specifically it will print the reconstructed momentum and
// position for the first object in the global reconstruction.
// It will also list the sub-detectors used by this reconstructed object.
// It will also histogram the number of globally reconstructed objects.

// Include to get Event Loop.
#include <nd280EventLoop.hxx>

#include <TG4Trajectory.hxx>
#include <TReconPID.hxx>
#include <TReconVertex.hxx>
#include <TReconCluster.hxx>
#include <TReconTrack.hxx>
#include <TReconShower.hxx>

// Includes for ROOT classes
#include <TH1F.h>
#include <TPad.h>

class TMyEventLoop: public ND::TND280EventLoopFunction {
    public:
        TMyEventLoop() {}
        virtual ~TMyEventLoop() {}

        void Initialize() {
            fNumberGlobalObjects = new TH1F("NumberGlobalObjects", "Number of Global Objects",25,-0.5,24.5);
        }

        bool operator () (ND::TND280Event& event) {

            // Get the algoritm result for global recon
            ND::THandle<ND::TAlgorithmResult> GlobalResult = event.GetFit("oaRecon");

            // Check that result exists
            if(!GlobalResult) return true;

            // Get a set of tracks from the FGD algorithm result.
            ND::THandle<ND::TReconObjectContainer> globalObjects
                = (GlobalResult)->GetResultsContainer("final");

            // Check that tracks exist
            if(!globalObjects) return true;

            // Fill histogram with number of found tracks.
            fNumberGlobalObjects->Fill(globalObjects->size());

            // Check that there are objects in list.
            if(globalObjects->size()>0) {

                // Get the first object in the list.
                ND::THandle<ND::TReconPID> pid = globalObjects->front();

                // Make sure this object is a PID.
                if(pid) {
                    // Get the reconstructed state for this first object.
                    ND::THandle<ND::TPIDState> state = pid->GetState();

                    // Print some interesting information.
                    std::cout << "\nFirst object is a TReconPID with reconstructed momentum/charge: " << state->GetMomentum() << "/" << state->GetCharge()<< std::endl;
                    std::cout << "Object position: " << state->GetPosition().X() << " "
                        << "Object position: " << state->GetPosition().Y() << " "
                        << "Object position: " << state->GetPosition().Z() << " "
                        << std::endl;
                                    std::cout << "Object used following detectors: ";
                                                      // Check if object uses POD.
                    if(pid->UsesDetector(ND::TReconBase::kP0D)) std::cout << "P0D:";
                                                      // Check if object uses P0D-ECAL.
                    if(pid->UsesDetector(ND::TReconBase::kPECal)) std::cout << "P0D-Ecal:";
                                                      // Check if object uses TPC1.
                    if(pid->UsesDetector(ND::TReconBase::kTPC1)) std::cout << "TPC1:";
                                                      // Check if object uses TPC2.
                    if(pid->UsesDetector(ND::TReconBase::kTPC2)) std::cout << "TPC2:";
                                                      // Check if object uses TPC3.
                    if(pid->UsesDetector(ND::TReconBase::kTPC3)) std::cout << "TPC3:";
                                                      // Check if object uses FGD.
                    if(pid->UsesDetector(ND::TReconBase::kFGD)) std::cout << "FGD:";
                                                      // Check if object uses tracker-ECAL.
                    if(pid->UsesDetector(ND::TReconBase::kTECal)) std::cout << "Tracker-ECAL:";
                                                      // Check if object uses SMRD.
                    if(pid->UsesDetector(ND::TReconBase::kSMRD)) std::cout << "SMRD:";
                    if(pid->UsesDetector(ND::TReconBase::kSFG)) std::cout << "SFGD:";
                    if(pid->UsesDetector(ND::TReconBase::kHAT)) return 0;
                    if(pid->UsesDetector(ND::TReconBase::kBottomHAT)) std::cout << "bottom HAT:";
                    if(pid->UsesDetector(ND::TReconBase::kTopHAT)) std::cout << "top HAT:";
                    if(pid->UsesDetector(ND::TReconBase::kTOF)) std::cout << "TOF:";

                    std::cout << std::endl;

                }
                else {
                    // Check what this object is if it is not a TReconPID...
                    ND::THandle<ND::TReconVertex> vertex = globalObjects->front();
                    if(vertex) std::cout << "\n First object in this event is actually a TReconVertex... " << std::endl;
                    ND::THandle<ND::TReconShower> shower = globalObjects->front();
                    if(shower) std::cout << "\n First object in this event is actually a TReconShower... " << std::endl;
                    ND::THandle<ND::TReconTrack> track = globalObjects->front();
                    if(track) std::cout << "\n First object in this event is actually a TReconTrack... " << std::endl;
                    // Print which detectors this object uses.
                    std::cout << "Object used following detectors: ";
                    if(track->UsesDetector(ND::TReconBase::kP0D)) std::cout << "P0D:";
                    if(track->UsesDetector(ND::TReconBase::kPECal)) std::cout << "P0D-Ecal:";
                    if(track->UsesDetector(ND::TReconBase::kTPC1)) std::cout << "TPC1:";
                    if(track->UsesDetector(ND::TReconBase::kTPC2)) std::cout << "TPC2:";
                    if(track->UsesDetector(ND::TReconBase::kTPC3)) std::cout << "TPC3:";
                    if(track->UsesDetector(ND::TReconBase::kFGD)) std::cout << "FGD:";
                    if(track->UsesDetector(ND::TReconBase::kTECal)) std::cout << "Tracker-ECAL:";
                    if(track->UsesDetector(ND::TReconBase::kSMRD)) std::cout << "SMRD:";
                    if(track->UsesDetector(ND::TReconBase::kSFG)) std::cout << "SFGD:";
                    if(track->UsesDetector(ND::TReconBase::kHAT)) return 0;
                    if(track->UsesDetector(ND::TReconBase::kBottomHAT)) std::cout << "bottom HAT:";
                    if(track->UsesDetector(ND::TReconBase::kTopHAT)) std::cout << "top HAT:";
                    if(track->UsesDetector(ND::TReconBase::kTOF)) std::cout << "TOF:";
                    // get hits from TReconTrack

                    
                    ND::THandle<ND::TReconCluster> cluster = globalObjects->front();
                    if(cluster) std::cout << "\n First object in this event is actually a TReconCluster... " << std::endl;

                }


                    


            }

            return true;
        }

        void Finalize(ND::TND280Output * const file) {
            fNumberGlobalObjects->Draw();
            gPad->Print("NumberGlobalObjects.eps");
        }

    private:
        TH1F* fNumberGlobalObjects;
};

int main(int argc, char **argv) {
    TMyEventLoop userCode;
    nd280EventLoop(argc,argv,userCode);
}